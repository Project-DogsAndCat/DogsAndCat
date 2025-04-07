import '../../../domain/models/location.dart';
import '../../../domain/repositories/location_repository.dart';

class MapService {
  final LocationRepository locationRepository;

  MapService(this.locationRepository);

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
