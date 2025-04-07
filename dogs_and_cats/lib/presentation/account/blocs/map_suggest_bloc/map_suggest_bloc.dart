import 'package:bloc/bloc.dart';
import 'package:dogs_and_cats/core/utils/extencions.dart';
import 'package:dogs_and_cats/domain/repositories/map_search_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../../domain/models/suggest_item.dart';

part 'map_suggest_bloc.freezed.dart';
part 'map_suggest_event.dart';
part 'map_suggest_state.dart';

class MapSuggestBloc extends Bloc<MapSuggestEvent, MapSuggestState> {
  String _searchText = '';
  late VisibleRegion _visibleRegion;
  MapSearchRepository repository;

  MapSuggestBloc({required this.repository})
      : super(const MapSuggestState.initial()) {
    on<MapSuggestEvent>(
      (event, emit) async {
        await event.map(
            getSuggestResult: (_) => _getSuggestResult(emit),
            queryChanged: (event) => _queryChanged(emit, event),
            regionChanged: (event) => _regionChanged(emit, event));
      },
    );
  }

  void setQueryText(String value) => _searchText = value;

  Future<void> _getSuggestResult(Emitter<MapSuggestState> emit) async {
    emit(MapSuggestState.loading());
    try {
      final (session, sessionResultFuture) = await repository.suggestByText(
        searchText: '$_searchText, Россия',
        bBox: _visibleRegion.toBoundingBox(),
      );
      final sessionResult = await sessionResultFuture;

      if (sessionResult.error != null) {
        emit(MapSuggestState.failure(message: sessionResult.error.toString()));
        return;
      }

      final items = sessionResult.items ?? [];

      final results = items
          .map(
            (item) => SuggestResponseItem(
              title: item.title,
              subtitle: item.subtitle,
              displayText: item.displayText,
              point: item.center,
            ),
          )
          .toList();
      emit(MapSuggestState.success(results: results));
      session.close();
    } catch (e) {
      emit(MapSuggestState.failure(message: e.toString()));
    }
  }

  Future<void> _queryChanged(
      Emitter<MapSuggestState> emit, _QueryChanged event) async {
    _searchText = event.query;
    emit(MapSuggestState.initial());
  }

  Future<void> _regionChanged(
      Emitter<MapSuggestState> emit, _RegionChanged event) async {
    _visibleRegion = event.region;
  }
}
