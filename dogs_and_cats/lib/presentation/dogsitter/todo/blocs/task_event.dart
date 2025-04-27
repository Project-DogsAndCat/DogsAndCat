part of 'task_bloc.dart';

@freezed
class TaskEvent with _$TaskEvent {
  const factory TaskEvent.load() = _Load;
  const factory TaskEvent.edit({
    required TaskModel task,
  }) = _Edit;
}
