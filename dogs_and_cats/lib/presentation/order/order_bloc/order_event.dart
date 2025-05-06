part of 'order_bloc.dart';

@freezed
class OrderEvent with _$OrderEvent {
  const factory OrderEvent.addOrder({
    required OrderModel order,
    required List<String> petIds,
  }) = _AddOrder;

  const factory OrderEvent.loadAllOrders() = _LoadAllOrders;

  const factory OrderEvent.loadRefusalOrders() = _LoadRefusalOrders;

  const factory OrderEvent.loadAdoptedOrders() = _LoadAdoptedOrders;

  const factory OrderEvent.loadCompletedOrders() = _LoadCompletedOrders;

  const factory OrderEvent.cancelOrder({
    required String orderId,
  }) = _CancelOrder;
}
