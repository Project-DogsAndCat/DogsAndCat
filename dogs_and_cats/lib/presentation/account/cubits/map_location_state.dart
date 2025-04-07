part of 'map_location_cubit.dart';

@freezed
class MapLocationState with _$MapLocationState {
  const factory MapLocationState.loading() = _Loading;
  const factory MapLocationState.loaded({required AppLatLong location}) =
      _Loaded;
}
