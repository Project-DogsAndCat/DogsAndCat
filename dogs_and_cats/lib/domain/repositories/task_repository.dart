import 'package:dogs_and_cats/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

import '../models/dogsitter.dart';
import '../models/task.dart';

abstract interface class TaskRepository {
  Future<Either<Failure, List<TaskModel>>> getAllTasks({
    required Dogsitter dogsitter,
  });

  Future<Either<Failure, List<TaskModel>>> getDistributions(
      {required String dogsitterId});

  Future<Either<Failure, Unit>> completeTask({
    required String orderId,
  });

  Future<Either<Failure, Unit>> acceptTask({
    required String orderId,
    required String dogsitterId,
  });
}
