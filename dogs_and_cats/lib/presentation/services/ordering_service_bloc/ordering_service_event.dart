part of 'ordering_service_bloc.dart';

@freezed
class OrderingServiceEvent with _$OrderingServiceEvent {
  const factory OrderingServiceEvent.loadTimeAndCostOfService({
    required String id,
    required String titleService,
  }) = _LoadTimeAndCostOfService;
}
