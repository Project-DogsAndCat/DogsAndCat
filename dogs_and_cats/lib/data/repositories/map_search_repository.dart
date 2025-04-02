import 'package:dogs_and_cats/domain/repositories/map_search_repository.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapSearchRepositoryImpl implements MapSearchRepository {
  @override
  Future<(SuggestSession, Future<SuggestSessionResult>)> searchByText({
    required String searchText,
    required BoundingBox bBox,
  }) async {
    final searchSession = await YandexSuggest.getSuggestions(
      text: searchText,
      boundingBox: bBox,
      suggestOptions: SuggestOptions(
        suggestType: SuggestType.unspecified,
        suggestWords: true,
      ),
    );
    return searchSession;
  }
}
