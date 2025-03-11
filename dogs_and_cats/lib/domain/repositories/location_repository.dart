import '../models/location.dart';

abstract interface class LocationRepository {
  Future<AppLatLong> getCurrentLocation();

  Future<bool> requestPermission();

  Future<bool> checkPermission();
}
