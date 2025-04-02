part of 'map_search_bloc.dart';

@freezed
class MapSearchEvent with _$MapSearchEvent {
  const factory MapSearchEvent.getSearchResult() = _GetSearchResult;
  const factory MapSearchEvent.queryChanged({
    required String query,
  }) = _QueryChanged;
  const factory MapSearchEvent.regionChanged({
    required VisibleRegion region,
  }) = _RegionChanged;
}
