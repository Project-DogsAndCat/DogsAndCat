import 'package:dogs_and_cats/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class TaskRepository {
  Future<Either<Failure, List<Task>>> getTasks({
    required List<String> serviceIds,
  });
}
