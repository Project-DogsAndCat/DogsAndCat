part of 'task_bloc.dart';

@freezed
class TaskEvent with _$TaskEvent {
  const factory TaskEvent.loadAllTask() = _LoadAllTask;

  const factory TaskEvent.loadAcceptedTask() = _LoadAcceptedTask;

  const factory TaskEvent.loadCompletedTask() = _LoadCompletedTask;

  const factory TaskEvent.accept({
    required String orderId,
  }) = _Accept;

  const factory TaskEvent.complete({
    required String orderId,
  }) = _Complete;
}
