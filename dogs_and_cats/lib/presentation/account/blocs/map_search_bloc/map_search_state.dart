part of 'map_search_bloc.dart';

@freezed
class MapSearchState with _$MapSearchState {
  const factory MapSearchState.loading() = _Loading;

  const factory MapSearchState.success({
    required List<SuggestResponseItem> results,
  }) = _Success;

  const factory MapSearchState.selectedObjectBySearching({
    required SuggestResponseItem selectedObject,
  }) = _SelectedObjectBySearching;

  const factory MapSearchState.failure({
    required String message,
  }) = _Failure;
}
