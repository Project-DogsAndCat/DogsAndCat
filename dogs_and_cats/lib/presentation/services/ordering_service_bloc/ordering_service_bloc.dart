import 'package:dogs_and_cats/domain/models/service_characteristics.dart';
import 'package:dogs_and_cats/domain/repositories/service_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ordering_service_event.dart';
part 'ordering_service_state.dart';
part 'ordering_service_bloc.freezed.dart';

class OrderingServiceBloc
    extends Bloc<OrderingServiceEvent, OrderingServiceState> {
  ServiceRepository repository;
  OrderingServiceBloc({required this.repository})
      : super(OrderingServiceState.initial()) {
    on<OrderingServiceEvent>((event, emit) async {
      await event.map(load: (event) => _load(event, emit));
    });
  }

  Future<void> _load(_Load event, Emitter<OrderingServiceState> emit) async {
    emit(OrderingServiceState.loading());
    print(event.id);
    final result = await repository.getCharacteristicsService(id: event.id);
    result.fold(
        (failure) =>
            emit(OrderingServiceState.failure(message: failure.message)),
        (characteristic) =>
            emit(OrderingServiceState.loaded(characteristics: characteristic)));
  }
}
