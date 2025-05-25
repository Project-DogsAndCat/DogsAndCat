import 'dart:async';

import 'package:dogs_and_cats/domain/models/order.dart';
import 'package:dogs_and_cats/domain/models/task.dart';
import 'package:dogs_and_cats/domain/repositories/order_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/error/failure.dart';

part 'order_bloc.freezed.dart';
part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderRepository orderRepository;
  late final StreamSubscription<Either<Failure, List<TaskModel>>> _subscription;

  Status? _status = Status.complete;
  OrderBloc({
    required this.orderRepository,
  }) : super(OrderState.initial()) {
    emit(OrderState.loading());
    _subscription = orderRepository.watchOrders().listen((result) {
      result
          .fold((failure) => emit(OrderState.failure(message: failure.message)),
              (orders) {
        final filtered = _applyFilter(orders, _status);
        emit(OrderState.loaded(tasks: filtered));
      });
    });
    on<OrderEvent>((event, emit) async {
      await event.map(
        addOrder: (event) => _addOrder(emit, event),
        loadAllOrders: (_) => _loadAllOrders(emit),
        loadRefusalOrders: (_) => _loadRefusalOrders(emit),
        loadAdoptedOrders: (_) => _loadAdoptedOrders(emit),
        loadCompletedOrders: (_) => _loadCompletedOrders(emit),
        cancelOrder: (event) => _cancelOrder(emit, event),
        addScore: (event) => _addScore(emit, event),
      );
    });
  }

  List<TaskModel> _applyFilter(List<TaskModel> tasks, Status? filter) {
    if (filter == null) return tasks;
    return tasks.where((task) => task.order.status == filter).toList();
  }

  Future<void> _addOrder(Emitter<OrderState> emit, _AddOrder event) async {
    emit(OrderState.loading());

    final result = await orderRepository.addOrder(
        order: event.order, petIds: event.petIds);

    result.fold((failure) => emit(OrderState.failure(message: failure.message)),
        (_) => emit(OrderState.initial()));
  }

  Future<void> _cancelOrder(
      Emitter<OrderState> emit, _CancelOrder event) async {
    emit(OrderState.loading());

    final result = await orderRepository.cancel(orderId: event.orderId);

    result.fold((failure) => emit(OrderState.failure(message: failure.message)),
        (orders) => emit(OrderState.initial()));
  }

  Future<void> _addScore(Emitter<OrderState> emit, _AddScore event) async {
    emit(OrderState.loading());

    final result = await orderRepository.addScore(
        score: event.score,
        dogsitterId: event.dogsitterId,
        orderId: event.orderId);

    result.fold((failure) => emit(OrderState.failure(message: failure.message)),
        (_) => emit(OrderState.successAddScore()));
  }

  Future<void> _loadAllOrders(Emitter<OrderState> emit) async {
    _status = null;
  }

  Future<void> _loadRefusalOrders(Emitter<OrderState> emit) async {
    _status = Status.refusal;
  }

  Future<void> _loadAdoptedOrders(Emitter<OrderState> emit) async {
    _status = Status.adopted;
  }

  Future<void> _loadCompletedOrders(Emitter<OrderState> emit) async {
    _status = Status.complete;
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
