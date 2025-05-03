import 'package:dogs_and_cats/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

import '../models/dogsitter.dart';
import '../models/order.dart';
import '../models/task.dart';

abstract interface class TaskRepository {
  Future<Either<Failure, List<TaskModel>>> getTasks({
    required Dogsitter dogsitter,
    required Status status,
  });

  Future<Either<Failure, Unit>> updateStatus({
    required Status prevStatus,
    required Status newStatus,
    required String orderId,
  });
}
