part of 'order_bloc.dart';

@freezed
class OrderEvent with _$OrderEvent {
  const factory OrderEvent.addOrder({
    required OrderModel order,
    required List<String> petIds,
  }) = _AddOrder;
  const factory OrderEvent.load() = _Load;
  const factory OrderEvent.cancelOrder({required OrderModel order}) =
      _CancelOrder;
}
