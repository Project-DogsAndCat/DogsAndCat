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
  final Map<String, List<TaskModel>> cache = {
    'all_task': [],
    'from_distributions': []
  };

  @override
  Future<Either<Failure, List<TaskModel>>> getAllTasks({
    required Dogsitter dogsitter,
  }) async {
    try {
      if (cache['all_task']!.isNotEmpty) return right(cache['all_task']!);

      List<String> serIds =
          dogsitter.serviceIds.map((element) => element.id).toList();
      final json = await supabaseClient.rpc('get_task', params: {
        'status_order': Status.waiting.value,
        '_point':
            'POINT(${dogsitter.person.longitude} ${dogsitter.person.latitude})',
        'service_ids': serIds,
      });
      if (json == null) return right([]);

      final tasks = json
          .map((json) => TaskDto.fromJson(json).toDomain())
          .toList()
          .cast<TaskModel>();

      addToCache(key: 'all_task', tasks: tasks);
      return right(tasks);
    } on SocketException catch (_) {
      return left(Failure(message: AppString.internetNotFound));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> completeTask({
    required String orderId,
  }) async {
    try {
      await supabaseClient
          .from(TableNames.orders)
          .update({'status': Status.complete.value}).eq('id', orderId);

      clearCache();
      return right(unit);
    } on SocketException catch (_) {
      return left(Failure(message: AppString.internetNotFound));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> acceptTask({
    required String orderId,
    required String dogsitterId,
  }) async {
    try {
      await Future.wait([
        supabaseClient
            .from(TableNames.orders)
            .update({'status': Status.adopted.value}).eq('id', orderId),
        supabaseClient
            .from(TableNames.distributions)
            .insert({'dogsitter_id': dogsitterId, 'order_id': orderId})
      ]);

      clearCache();
      return right(unit);
    } on SocketException catch (_) {
      return left(Failure(message: AppString.internetNotFound));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TaskModel>>> getDistributions(
      {required String dogsitterId}) async {
    try {
      if (cache['from_distributions']!.isNotEmpty) {
        return right(cache['from_distributions']!);
      }

      final json = await supabaseClient
          .rpc('get_distributions', params: {'d_dogsitter_id': dogsitterId});

      if (json == null) return right([]);

      final tasks = json
          .map((json) => TaskDto.fromJson(json).toDomain())
          .toList()
          .cast<TaskModel>();

      addToCache(key: 'from_distributions', tasks: tasks);
      return right(tasks);
    } on SocketException catch (_) {
      return left(Failure(message: AppString.internetNotFound));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  void addToCache({
    required String key,
    required List<TaskModel> tasks,
  }) {
    cache[key]!.addAll(tasks);
  }

  void clearCache() {
    cache['all_task']!.clear();
    cache['from_distributions']!.clear();
  }
}
