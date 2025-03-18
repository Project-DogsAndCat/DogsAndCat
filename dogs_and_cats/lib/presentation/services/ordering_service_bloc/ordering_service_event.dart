part of 'ordering_service_bloc.dart';

@freezed
class OrderingServiceEvent with _$OrderingServiceEvent {
  const factory OrderingServiceEvent.load({
    required String id,
  }) = _Load;
}
