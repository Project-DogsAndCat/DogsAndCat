import 'package:dogs_and_cats/domain/models/order.dart';
import 'package:dogs_and_cats/domain/repositories/order_repository.dart';
import 'package:dogs_and_cats/domain/repositories/service_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/service.dart';

part 'order_bloc.freezed.dart';
part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderRepository orderRepository;
  ServiceRepository serviceRepository;
  OrderBloc({
    required this.orderRepository,
    required this.serviceRepository,
  }) : super(OrderState.loading()) {
    on<OrderEvent>((event, emit) async {
      await event.map(
          addOrder: (event) => _addOrder(emit, event),
          load: (event) => _load(emit, event),
          cancelOrder: (event) => _cancelOrder(emit, event));
    });
  }

  Future<void> _addOrder(Emitter<OrderState> emit, _AddOrder event) async {
    emit(OrderState.loading());

    final result = await orderRepository.addOrder(
        order: event.order, petIds: event.petIds);

    result.fold((failure) => emit(OrderState.failure(message: failure.message)),
        (_) => add(_Load()));
  }

  Future<void> _load(Emitter<OrderState> emit, _Load event) async {
    try {
      final response = await Future.wait([
        orderRepository.getOrders(),
        serviceRepository.getServices(),
      ]);

      final orders = response[0].cast<OrderModel>();
      final services = response[1].cast<Service>();

      final mapService = {for (var item in services) item.id: item};

      final result =
          orders.map((order) => mapService[order.serviceId]!).toList();
      emit(OrderState.loaded(orders: orders, services: result));
    } catch (e) {
      emit(OrderState.failure(message: e.toString()));
    }
  }

  Future<void> _cancelOrder(
      Emitter<OrderState> emit, _CancelOrder event) async {
    emit(OrderState.loading());

    final result = await orderRepository.cancelOrder(order: event.order);

    result.fold((failure) => emit(OrderState.failure(message: failure.message)),
        (orders) => add(_Load()));
  }
}
