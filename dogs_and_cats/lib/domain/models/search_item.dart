import 'package:yandex_mapkit/yandex_mapkit.dart';

final class SearchResponseItem {
  final Point point;
  final GeoObject? geoObject;

  const SearchResponseItem({required this.point, required this.geoObject});

  @override
  String toString() {
    return "Point(latitude: ${point.latitude}, longitude: ${point.longitude})";
  }
}
