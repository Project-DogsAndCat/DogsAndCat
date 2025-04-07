import 'package:bloc/bloc.dart';
import 'package:dogs_and_cats/domain/repositories/map_search_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../../domain/models/search_item.dart';

part 'map_search_bloc.freezed.dart';
part 'map_search_event.dart';
part 'map_search_state.dart';

class MapSearchBloc extends Bloc<MapSearchEvent, MapSearchState> {
  final MapSearchRepository repository;
  late Point point;
  MapSearchBloc({required this.repository})
      : super(const MapSearchState.initial()) {
    on<MapSearchEvent>(
      (event, emit) {
        event.map(
            getSearchResult: (_) async => await _getSearchResult(emit),
            pointChanged: (event) => _pointChanged(emit, event));
      },
    );
  }

  Future<void> _getSearchResult(Emitter<MapSearchState> emit) async {
    emit(MapSearchState.loading());
    try {
      final (session, sessionResultFuture) =
          await repository.searchByPoint(point: point);
      final sessionResult = await sessionResultFuture;

      if (sessionResult.error != null) {
        emit(MapSearchState.failure(message: sessionResult.error.toString()));
        return;
      }

      final items = sessionResult.items ?? [];

      final results = items
          .map(
            (item) => SearchResponseItem(
              name: item.name,
              metadata: item.toponymMetadata,
            ),
          )
          .toList();
      emit(MapSearchState.success(results: results));
      session.close();
    } catch (e) {
      emit(MapSearchState.failure(message: e.toString()));
    }
  }

  void _pointChanged(Emitter<MapSearchState> emit, _PointChanged event) {
    emit(MapSearchState.initial());
    point = event.point;
  }
}
