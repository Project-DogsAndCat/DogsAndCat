part of 'order_bloc.dart';

@freezed
class OrderEvent with _$OrderEvent {
  const factory OrderEvent.addOrder({
    required OrderModel order,
    required List<String> petIds,
  }) = _AddOrder;

  const factory OrderEvent.load({
    Status? status,
  }) = _Load;

  const factory OrderEvent.cancelOrder({
    required String orderId,
  }) = _CancelOrder;
}
