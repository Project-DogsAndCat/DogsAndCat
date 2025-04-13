part of 'ordering_service_bloc.dart';

@freezed
class OrderingServiceState with _$OrderingServiceState {
  const factory OrderingServiceState.loading() = _Loading;
  const factory OrderingServiceState.loaded({
    required List<ServiceCharacteristic> characteristics,
    required String idService,
    required String titleService,
  }) = _Loaded;
  const factory OrderingServiceState.failure({
    required String message,
  }) = _Failure;
}
