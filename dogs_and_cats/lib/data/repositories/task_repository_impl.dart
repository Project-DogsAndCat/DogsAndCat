import 'dart:async';
import 'dart:io';

import 'package:dogs_and_cats/core/error/failure.dart';
import 'package:dogs_and_cats/data/models/task/task_dto.dart';
import 'package:dogs_and_cats/domain/models/dogsitter.dart';
import 'package:dogs_and_cats/domain/models/order.dart';
import 'package:dogs_and_cats/domain/repositories/task_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/utils/app_strings.dart';
import '../../core/utils/table_names.dart';
import '../../domain/models/task.dart';

class TaskRepositoryImpl implements TaskRepository {
  TaskRepositoryImpl({required this.supabaseClient});
  final SupabaseClient supabaseClient;

  Future<Either<Failure, List<TaskModel>>> _getAllTasks({
    required Dogsitter dogsitter,
  }) async {
    try {
      List<String> serIds =
          dogsitter.serviceIds!.map((element) => element.id).toList();
      final json = await supabaseClient.rpc('get_task', params: {
        'status_order': Status.waiting.value,
        '_point':
            'POINT(${dogsitter.person.longitude} ${dogsitter.person.latitude})',
        'service_ids': serIds
      });
      if (json == null) return right([]);
      final tasks = json
          .map((json) => TaskDto.fromJson(json).toDomain())
          .toList()
          .cast<TaskModel>();
      return right(tasks);
    } on SocketException catch (_) {
      return left(Failure(message: AppString.internetNotFound));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Stream<Either<Failure, List<TaskModel>>> watchTasks(
      {required Dogsitter dogsitter}) {
    final controller = StreamController<Either<Failure, List<TaskModel>>>();
    RealtimeChannel? channel;
    try {
      channel = supabaseClient
          .channel('all_tasks_changes')
          .onPostgresChanges(
            event: PostgresChangeEvent.all,
            schema: 'public',
            table: TableNames.orders,
            callback: (_) => _handleTaskChange(controller, dogsitter),
          )
          .subscribe((status, [error]) {
        if (status == RealtimeSubscribeStatus.subscribed) {
          _handleTaskChange(controller, dogsitter);
        }
        if (status == RealtimeSubscribeStatus.channelError) {
          controller.add(left(Failure(message: "Subscription error")));
        }
      });
    } catch (e) {
      controller.add(left(Failure(message: e.toString())));
    }
    controller.onCancel = () {
      channel?.unsubscribe();
      controller.close();
    };
    return controller.stream;
  }

  void _handleTaskChange(
      StreamController<Either<Failure, List<TaskModel>>> controller,
      Dogsitter dogsitter) async {
    try {
      final result = await _getAllTasks(dogsitter: dogsitter);
      controller.add(result);
    } catch (e) {
      controller.add(left(Failure(message: e.toString())));
    }
  }
}
