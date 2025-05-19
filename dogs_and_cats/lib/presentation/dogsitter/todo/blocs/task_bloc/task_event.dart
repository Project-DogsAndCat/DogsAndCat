part of 'task_bloc.dart';

@freezed
class TaskEvent with _$TaskEvent {
  const factory TaskEvent.initialize({
    required Dogsitter dogsitter,
  }) = _Initialize;

  const factory TaskEvent.tasksUpdated({
    required Either<Failure, List<TaskModel>> result,
  }) = _TasksUpdated;
}
