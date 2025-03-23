part of 'ordering_service_bloc.dart';

@freezed
class OrderingServiceState with _$OrderingServiceState {
  const factory OrderingServiceState.loading() = _Loading;
  const factory OrderingServiceState.loaded({
    required List<ServiceCharacteristic> characteristics,
  }) = _Loaded;
  const factory OrderingServiceState.success() = _Success;
  const factory OrderingServiceState.failure({
    required String message,
  }) = _Failure;
}
