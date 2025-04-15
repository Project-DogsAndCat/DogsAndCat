import 'package:dogs_and_cats/domain/models/service.dart';
import 'package:dogs_and_cats/domain/repositories/service_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'services_bloc.freezed.dart';
part 'services_event.dart';
part 'services_state.dart';

class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {
  ServiceRepository repository;

  ServicesBloc({required this.repository}) : super(ServicesState.loading()) {
    on<ServicesEvent>((event, emit) async {
      await event.map(
        load: (_) => _load(emit),
        loadById: (event) => _loadById(emit, event),
      );
    });
  }

  Future<void> _load(Emitter<ServicesState> emit) async {
    // final result = await repository.getServices();
    // result.fold(
    //     (failure) => emit(ServicesState.failure(message: failure.message)),
    //     (service) => emit(ServicesState.loaded(service: service)));

    try {
      final result = await repository.getServices();
      emit(ServicesState.loaded(service: result));
    } catch (e) {
      emit(ServicesState.failure(message: e.toString()));
    }
  }

  Future<void> _loadById(Emitter<ServicesState> emit, _LoadById event) async {
    final service = await repository.getServiceById(serviceId: event.serviceId);
    service.fold(
        (failure) => emit(ServicesState.failure(message: failure.message)),
        (service) => emit(ServicesState.loadedService(service: service)));
  }
}
