part of 'order_bloc.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState.loading() = _Loading;
  const factory OrderState.newOrderInfo({
    required OrderModel order,
  }) = _NewOrderInfo;
  const factory OrderState.loaded({
    required List<OrderModel> orders,
  }) = _Loaded;
  const factory OrderState.failure({
    required String message,
  }) = _Failure;
  const factory OrderState.initial() = _Initial;
}
