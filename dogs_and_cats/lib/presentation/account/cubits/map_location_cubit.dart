import 'package:bloc/bloc.dart';
import 'package:dogs_and_cats/domain/services/map_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/location.dart';

part 'map_location_cubit.freezed.dart';
part 'map_location_state.dart';

class MapLocationCubit extends Cubit<MapLocationState> {
  MapService service;
  MapLocationCubit({required this.service})
      : super(const MapLocationState.loading());

  Future<void> initializeMap() async {
    await service.checkAndRequestPermissions();
    final location = await service.getCurrentLocation();
    emit(MapLocationState.loaded(location: location));
  }
}
