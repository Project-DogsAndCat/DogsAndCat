import 'package:dogs_and_cats/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

import '../models/dogsitter.dart';
import '../models/task.dart';

abstract interface class TaskRepository {
  Stream<Either<Failure, List<TaskModel>>> watchTasks({
    required Dogsitter dogsitter,
  });
}
