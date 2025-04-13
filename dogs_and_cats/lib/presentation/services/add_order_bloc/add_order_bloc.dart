import 'package:dogs_and_cats/data/models/order/order_dto.dart';
import 'package:dogs_and_cats/domain/models/order.dart';
import 'package:dogs_and_cats/domain/repositories/service_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_order_event.dart';
part 'add_order_state.dart';
part 'add_order_bloc.freezed.dart';

class AddOrderBloc extends Bloc<AddOrderEvent, AddOrderState> {
  ServiceRepository repository;
  AddOrderBloc({required this.repository}) : super(AddOrderState.initial()) {
    on<AddOrderEvent>((event, emit) async {
      await event.map(
        addOrder: (event) => _addOrder(event, emit),
      );
    });
  }

  Future<void> _addOrder(_AddOrder event, Emitter<AddOrderState> emit) async {
    emit(AddOrderState.loading());
    final result = await repository.addOrder(
      dto: OrderDto.fromDomain(event.order),
      petIds: event.petIds,
    );

    result.fold(
        (failure) => emit(AddOrderState.failure(message: failure.message)),
        (_) => emit(AddOrderState.success(order: event.order)));
  }
}
