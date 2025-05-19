import 'dart:async';
import 'dart:io';

import 'package:dogs_and_cats/core/error/failure.dart';
import 'package:dogs_and_cats/domain/models/task.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/utils/app_strings.dart';
import '../../core/utils/table_names.dart';
import '../../domain/models/order.dart';
import '../../domain/repositories/distribution_repository.dart';
import '../models/task/task_dto.dart';

class DistributionRepositoryImpl implements DistributionRepository {
  DistributionRepositoryImpl({required this.supabaseClient});
  final SupabaseClient supabaseClient;

  @override
  Future<Either<Failure, List<TaskModel>>> getDistributions(
      {required String dogsitterId}) async {
    try {
      final json = await supabaseClient
          .rpc('get_distributions', params: {'d_dogsitter_id': dogsitterId});
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
  Future<Either<Failure, Unit>> completeTask({
    required String orderId,
  }) async {
    try {
      await supabaseClient
          .from(TableNames.orders)
          .update({'status': Status.complete.value}).eq('id', orderId);
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
      return right(unit);
    } on SocketException catch (_) {
      return left(Failure(message: AppString.internetNotFound));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
