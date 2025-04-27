part of 'task_bloc.dart';

@freezed
class TaskState with _$TaskState {
  const factory TaskState.loading() = _Loading;
  const factory TaskState.loaded({
    required List<TaskModel> tasks,
  }) = _Loaded;
  const factory TaskState.failure({required String message}) = _Failure;
}
