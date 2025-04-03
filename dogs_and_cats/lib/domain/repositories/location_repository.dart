import 'package:dogs_and_cats/domain/models/location.dart';

abstract interface class LocationRepository {
  Future<AppLatLong> getCurrentLocation();

  Future<bool> requestPermission();

  Future<bool> checkPermission();
}
