part of 'add_order_bloc.dart';

@freezed
class AddOrderEvent with _$AddOrderEvent {
  const factory AddOrderEvent.addOrder({
    required Order order,
    required List<String> petIds,
  }) = _AddOrder;
}
