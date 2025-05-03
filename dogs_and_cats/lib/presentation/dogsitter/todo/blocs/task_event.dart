part of 'task_bloc.dart';

@freezed
class TaskEvent with _$TaskEvent {
  const factory TaskEvent.load({
    required Status status,
  }) = _Load;

  const factory TaskEvent.accept({
    required Status prevStatus,
    required Status newStatus,
    required String orderId,
  }) = _Accept;
}
