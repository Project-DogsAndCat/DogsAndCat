part of 'map_suggest_bloc.dart';

@freezed
class MapSuggestEvent with _$MapSuggestEvent {
  const factory MapSuggestEvent.getSuggestResult() = _GetSuggestResult;
  const factory MapSuggestEvent.queryChanged({
    required String query,
  }) = _QueryChanged;
  const factory MapSuggestEvent.regionChanged({
    required VisibleRegion region,
  }) = _RegionChanged;
}
