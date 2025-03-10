import 'package:dogs_and_cats/domain/models/service.dart';
import 'package:dogs_and_cats/domain/repositories/service_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'services_event.dart';
part 'services_state.dart';
part 'services_bloc.freezed.dart';

class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {
  ServiceRepository repository;

  ServicesBloc({required this.repository}) : super(ServicesState.loading()) {
    on<ServicesEvent>((event, emit) async {
      await event.map(load: (event) => _load(emit));
    });
  }

  Future<void> _load(Emitter<ServicesState> emit) async {
    final result = await repository.getServices();
    print('long ${result.length()}');
    print(result);
    result.fold(
        (failure) => emit(ServicesState.failure(message: failure.message)),
        (service) => emit(ServicesState.loaded(service: service)));
  }
}
