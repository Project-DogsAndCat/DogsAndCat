part of 'map_search_bloc.dart';

@freezed
class MapSearchEvent with _$MapSearchEvent {
  const factory MapSearchEvent.getSearchResult() = _GetSearchResult;
  const factory MapSearchEvent.pointChanged({required Point point}) =
      _PointChanged;
  const factory MapSearchEvent.setSelectObject(
      {required SuggestResponseItem item}) = _SetSelectObject;
}
