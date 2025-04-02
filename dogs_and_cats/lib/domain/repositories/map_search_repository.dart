import 'package:yandex_mapkit/yandex_mapkit.dart';

abstract interface class MapSearchRepository {
  Future<(SuggestSession, Future<SuggestSessionResult>)> searchByText({
    required String searchText,
    required BoundingBox bBox,
  });
}
