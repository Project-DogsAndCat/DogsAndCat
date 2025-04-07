part of 'map_suggest_bloc.dart';

@freezed
class MapSuggestState with _$MapSuggestState {
  const factory MapSuggestState.initial() = _Initial;
  const factory MapSuggestState.loading() = _Loading;
  const factory MapSuggestState.success({
    required List<SuggestResponseItem> results,
  }) = _Success;
  const factory MapSuggestState.failure({required String message}) = _Failure;
}
