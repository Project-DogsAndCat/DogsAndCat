import 'package:yandex_mapkit/yandex_mapkit.dart';

abstract interface class MapSearchRepository {
  Future<(SuggestSession, Future<SuggestSessionResult>)> suggestByText({
    required String searchText,
    required BoundingBox bBox,
  });
  Future<(SearchSession, Future<SearchSessionResult>)> searchByPoint(
      {required Point point});
}
