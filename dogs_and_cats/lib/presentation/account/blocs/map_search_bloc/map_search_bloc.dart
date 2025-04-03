import 'package:bloc/bloc.dart';
import 'package:dogs_and_cats/core/utils/extencions.dart';
import 'package:dogs_and_cats/domain/models/location.dart';
import 'package:dogs_and_cats/domain/repositories/map_search_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../../domain/models/suggest_item.dart';

part 'map_search_bloc.freezed.dart';
part 'map_search_event.dart';
part 'map_search_state.dart';

class MapSearchBloc extends Bloc<MapSearchEvent, MapSearchState> {
  String _searchText = '';
  VisibleRegion? _visibleRegion;
  MapSearchRepository repository;
  AppLatLong location = MoscowLocation();

  MapSearchBloc({required this.repository})
      : super(const MapSearchState.initial()) {
    on<MapSearchEvent>(
      (event, emit) async {
        await event.map(
            getSearchResult: (_) => _getSearchResult(emit),
            queryChanged: (event) => _queryChanged(emit, event),
            regionChanged: (event) => regionChanged(emit, event));
      },
    );
  }

  void setQueryText(String value) => _searchText = value;

  Future<void> _getSearchResult(Emitter<MapSearchState> emit) async {
    emit(MapSearchState.loading());
    try {
      final (session, sessionResultFuture) = await repository.searchByText(
        searchText: '$_searchText, Москва',
        bBox: _visibleRegion!.toBoundingBox(),
      );
      final sessionResult = await sessionResultFuture;

      if (sessionResult.error != null) {
        emit(MapSearchState.failure(message: sessionResult.error!.toString()));
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
      emit(MapSearchState.success(results: results));
      session.close();
    } catch (e) {
      emit(MapSearchState.failure(message: e.toString()));
    }
  }

  Future<void> _queryChanged(
      Emitter<MapSearchState> emit, _QueryChanged event) async {
    _searchText = event.query;
    emit(MapSearchState.initial());
  }

  Future<void> regionChanged(
      Emitter<MapSearchState> emit, _RegionChanged event) async {
    _visibleRegion = event.region;
  }
}
