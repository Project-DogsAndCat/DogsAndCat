import '../../../domain/models/location.dart';
import '../../../domain/repositories/location_repository.dart';

class MapService {
  MapService({required this.locationRepository});
  final LocationRepository locationRepository;

  Future<void> checkAndRequestPermissions() async {
    if (!await locationRepository.checkPermission()) {
      await locationRepository.requestPermission();
    }
  }

  Future<AppLatLong> getCurrentLocation() async {
    try {
      return await locationRepository.getCurrentLocation();
    } catch (_) {
      return const MoscowLocation();
    }
  }
}
