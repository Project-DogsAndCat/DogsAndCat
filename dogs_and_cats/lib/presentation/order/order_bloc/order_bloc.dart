import 'package:dogs_and_cats/domain/models/order.dart';
import 'package:dogs_and_cats/domain/models/task.dart';
import 'package:dogs_and_cats/domain/repositories/order_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_bloc.freezed.dart';
part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderRepository orderRepository;
  OrderBloc({
    required this.orderRepository,
  }) : super(OrderState.initial()) {
    on<OrderEvent>((event, emit) async {
      await event.map(
        addOrder: (event) => _addOrder(emit, event),
        loadAllOrders: (_) => _loadAllOrders(emit),
        loadRefusalOrders: (_) => _loadRefusalOrders(emit),
        loadAdoptedOrders: (_) => _loadAdoptedOrders(emit),
        loadCompletedOrders: (_) => _loadCompletedOrders(emit),
        cancelOrder: (event) => _cancelOrder(emit, event),
      );
    });
  }

  Future<void> _addOrder(Emitter<OrderState> emit, _AddOrder event) async {
    emit(OrderState.loading());

    final result = await orderRepository.addOrder(
        order: event.order, petIds: event.petIds);

    result.fold((failure) => emit(OrderState.failure(message: failure.message)),
        (_) => add(_LoadAllOrders()));
  }

  Future<void> _loadAllOrders(Emitter<OrderState> emit) async {
    emit(OrderState.loading());

    final response = await orderRepository.getOrders();
    response.fold(
        (failure) => emit(OrderState.failure(message: failure.message)),
        (task) => emit(OrderState.loaded(tasks: task.cast<TaskModel>())));
  }

  Future<void> _cancelOrder(
      Emitter<OrderState> emit, _CancelOrder event) async {
    emit(OrderState.loading());

    final result = await orderRepository.cancel(orderId: event.orderId);

    result.fold((failure) => emit(OrderState.failure(message: failure.message)),
        (orders) => add(_LoadAllOrders()));
  }

  Future<void> _loadRefusalOrders(Emitter<OrderState> emit) async {
    emit(OrderState.loading());
    final tasks = await filteredTask(status: Status.refusal, emit: emit);
    emit(OrderState.loaded(tasks: tasks));
  }

  Future<void> _loadAdoptedOrders(Emitter<OrderState> emit) async {
    emit(OrderState.loading());
    final tasks = await filteredTask(status: Status.adopted, emit: emit);
    emit(OrderState.loaded(tasks: tasks));
  }

  Future<void> _loadCompletedOrders(Emitter<OrderState> emit) async {
    emit(OrderState.loading());
    final tasks = await filteredTask(status: Status.complete, emit: emit);
    emit(OrderState.loaded(tasks: tasks));
  }

  Future<List<TaskModel>> filteredTask(
      {required Status status, required Emitter<OrderState> emit}) async {
    final result = await orderRepository.getOrders();
    List<TaskModel> filtered = [];
    result.fold((failure) {
      emit(OrderState.failure(message: failure.message));
      return;
    }, (orders) {
      filtered = orders.where((order) => order.order.status == status).toList();
    });
    return filtered;
  }
}
