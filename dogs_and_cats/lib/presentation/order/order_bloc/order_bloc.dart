import 'package:dogs_and_cats/domain/models/order.dart';
import 'package:dogs_and_cats/domain/repositories/order_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_bloc.freezed.dart';
part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderRepository repository;
  OrderBloc({required this.repository}) : super(OrderState.initial()) {
    on<OrderEvent>((event, emit) async {
      await event.map(
          addOrder: (event) => _addOrder(emit, event),
          load: (event) => _load(emit, event),
          cancelOrder: (event) => _cancelOrder(emit, event));
    });
  }

  Future<void> _addOrder(Emitter<OrderState> emit, _AddOrder event) async {
    emit(OrderState.loading());

    final result =
        await repository.addOrder(order: event.order, petIds: event.petIds);

    result.fold((failure) => emit(OrderState.failure(message: failure.message)),
        (_) => add(_Load()));
  }

  Future<void> _load(Emitter<OrderState> emit, _Load event) async {
    emit(OrderState.loading());

    final result = await repository.getOrders();

    result.fold((failure) => emit(OrderState.failure(message: failure.message)),
        (orders) => emit(OrderState.loaded(orders: orders)));
  }

  Future<void> _cancelOrder(
      Emitter<OrderState> emit, _CancelOrder event) async {
    emit(OrderState.loading());

    final result = await repository.cancelOrder(order: event.order);

    result.fold((failure) => emit(OrderState.failure(message: failure.message)),
        (orders) => add(_Load()));
  }
}
