import 'package:fpdart/fpdart.dart';

import '../../core/error/failure.dart';
import '../models/task.dart';

abstract interface class DistributionRepository {
  Future<Either<Failure, List<TaskModel>>> getDistributions({
    required String dogsitterId,
  });

  Future<Either<Failure, Unit>> completeTask({
    required String orderId,
  });

  Future<Either<Failure, Unit>> acceptTask({
    required String orderId,
    required String dogsitterId,
  });
}
