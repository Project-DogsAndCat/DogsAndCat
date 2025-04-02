import 'dart:math';

import 'package:yandex_mapkit/yandex_mapkit.dart';

extension LetExtension<T> on T {
  R let<R>(R Function(T it) block) => block(this);
}

extension VisibleRegionExtensions on VisibleRegion {
  BoundingBox toBoundingBox() {
    return BoundingBox(
      northEast: Point(
        latitude: max(topLeft.latitude, topRight.latitude),
        longitude: max(topRight.longitude, bottomRight.longitude),
      ),
      southWest: Point(
        latitude: min(bottomLeft.latitude, bottomLeft.latitude),
        longitude: min(topLeft.longitude, bottomLeft.longitude),
      ),
    );
  }
}
