import 'package:dogs_and_cats/domain/repositories/map_search_repository.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapSearchRepositoryImpl implements MapSearchRepository {
  @override
  Future<(SuggestSession, Future<SuggestSessionResult>)> suggestByText({
    required String searchText,
    required BoundingBox bBox,
  }) async {
    final suggestSession = await YandexSuggest.getSuggestions(
      text: searchText,
      boundingBox: bBox,
      suggestOptions: SuggestOptions(
        suggestType: SuggestType.unspecified,
        suggestWords: true,
      ),
    );
    return suggestSession;
  }

  @override
  Future<(SearchSession, Future<SearchSessionResult>)> searchByPoint(
      {required Point point}) async {
    final searchSession = await YandexSearch.searchByPoint(
      point: point,
      searchOptions: SearchOptions(
        geometry: true,
      ),
    );
    return searchSession;
  }
}
