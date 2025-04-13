part of 'add_order_bloc.dart';

@freezed
class AddOrderState with _$AddOrderState {
  const factory AddOrderState.loading() = _Loading;
  const factory AddOrderState.success({
    required Order order,
  }) = _Success;
  const factory AddOrderState.failure({
    required String message,
  }) = _Failure;
  const factory AddOrderState.initial() = _Initial;
}
