import 'package:dogs_and_cats/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

import '../models/service.dart';
import '../models/task.dart';

abstract interface class TaskRepository {
  Future<Either<Failure, List<TaskModel>>> getTasks({
    required List<Service> serviceIds,
  });
}
