import 'package:dogs_and_cats/domain/models/location.dart';
import 'package:geolocator/geolocator.dart';

import '../../domain/repositories/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final defLocation = const MoscowLocation();
  AppLatLong? userLocation;

  @override
  Future<AppLatLong> getCurrentLocation() async {
    if (userLocation != null) {
      return userLocation!;
    }
    return Geolocator.getCurrentPosition().then((value) {
      userLocation = AppLatLong(lat: value.latitude, long: value.longitude);
      return userLocation!;
    }).catchError(
      (_) => defLocation,
    );
  }

  @override
  Future<bool> requestPermission() {
    return Geolocator.requestPermission()
        .then((value) =>
            value == LocationPermission.always ||
            value == LocationPermission.whileInUse)
        .catchError((_) => false);
  }

  @override
  Future<bool> checkPermission() {
    return Geolocator.checkPermission()
        .then((value) =>
            value == LocationPermission.always ||
            value == LocationPermission.whileInUse)
        .catchError((_) => false);
  }
}
