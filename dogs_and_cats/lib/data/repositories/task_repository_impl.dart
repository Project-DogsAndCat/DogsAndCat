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
  final Map<String, List<TaskModel>> cache = {};

  @override
  Future<Either<Failure, List<TaskModel>>> getTasks({
    required Dogsitter dogsitter,
    required Status status,
  }) async {
    try {
      if (cache[status.value] != null && cache[status.value]!.isNotEmpty) {
        return right(cache[status.value]!);
      }

      List<String> serIds =
          dogsitter.serviceIds.map((element) => element.id).toList();
      final json = await supabaseClient.rpc('get_task', params: {
        'status_order': status.value,
        '_point':
            'POINT(${dogsitter.person.longitude} ${dogsitter.person.latitude})',
        'service_ids': serIds,
      });

      if (json == null) {
        return left(Failure(message: 'Пока нет ни одного заказа.'));
      }

      final tasks = json
          .map((json) => TaskDto.fromJson(json).toDomain())
          .toList()
          .cast<TaskModel>();

      addToCache(status: status.value, tasks: tasks);
      return right(tasks);
    } on SocketException catch (_) {
      return left(Failure(message: AppString.internetNotFound));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateStatus({
    required Status prevStatus,
    required Status newStatus,
    required String orderId,
  }) async {
    try {
      clearCache(prevStatus: prevStatus.value, newStatus: newStatus.value);

      await supabaseClient
          .from(TableNames.orders)
          .update({'status': newStatus.value}).eq('id', orderId);
      return right(unit);
    } on SocketException catch (_) {
      return left(Failure(message: AppString.internetNotFound));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  void addToCache({
    required String status,
    required List<TaskModel> tasks,
  }) {
    cache[status] = tasks;
  }

  void clearCache({required String prevStatus, required String newStatus}) {
    cache[prevStatus]?.clear();
    cache[newStatus]?.clear();
  }
}
