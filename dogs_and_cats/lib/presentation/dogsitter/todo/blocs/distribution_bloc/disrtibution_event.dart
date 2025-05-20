part of 'disrtibution_bloc.dart';

@freezed
class DistributionEvent with _$DistributionEvent {
  const factory DistributionEvent.load({
    required Status status,
    required Dogsitter dogsitter,
  }) = _Load;

  const factory DistributionEvent.accept({
    required String orderId,
    required Person person,
    required Dogsitter dogsitter,
    required String serviceTitle,
    required OrderModel order,
  }) = _Accept;

  const factory DistributionEvent.complete({
    required String orderId,
    required Dogsitter dogsitter,
  }) = _Complete;
}
