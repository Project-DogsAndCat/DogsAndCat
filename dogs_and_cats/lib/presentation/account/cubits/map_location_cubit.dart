import 'package:bloc/bloc.dart';
import 'package:dogs_and_cats/domain/services/map_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/location.dart';
import '../../../domain/repositories/person_repository.dart';

part 'map_location_cubit.freezed.dart';
part 'map_location_state.dart';

class MapLocationCubit extends Cubit<MapLocationState> {
  final PersonRepository repository;
  final MapService service;
  MapLocationCubit({
    required this.service,
    required this.repository,
  }) : super(const MapLocationState.loading());

  Future<void> initializeMap() async {
    await service.checkAndRequestPermissions();
    final location = await service.getCurrentLocation();
    emit(MapLocationState.loaded(location: location));
  }

  Future<void> getAddressPerson() async {
    final result = await repository.getPerson();
    result.fold(
      (failure) => emit(MapLocationState.failure(message: failure.message)),
      (person) => emit(
        MapLocationState.loaded(
          location: AppLatLong(lat: person.latitude, long: person.longitude),
        ),
      ),
    );
  }
}
