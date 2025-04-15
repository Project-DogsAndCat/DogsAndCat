part of 'order_bloc.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState.loading() = _Loading;
  const factory OrderState.loaded({
    required List<OrderModel> orders,
    required List<Service> services,
  }) = _Loaded;
  const factory OrderState.failure({
    required String message,
  }) = _Failure;
}
