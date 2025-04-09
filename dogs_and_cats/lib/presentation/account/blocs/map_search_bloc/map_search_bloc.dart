import 'package:bloc/bloc.dart';
import 'package:dogs_and_cats/domain/repositories/map_search_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../../domain/models/suggest_item.dart';

part 'map_search_bloc.freezed.dart';
part 'map_search_event.dart';
part 'map_search_state.dart';

class MapSearchBloc extends Bloc<MapSearchEvent, MapSearchState> {
  final MapSearchRepository repository;
  late Point point;
  SuggestResponseItem? selectedObject;
  MapSearchBloc({required this.repository})
      : super(const MapSearchState.loading()) {
    on<MapSearchEvent>(
      (event, emit) async {
        await event.map(
          getSearchResult: (_) => _getSearchResult(emit),
          pointChanged: (event) => _pointChanged(emit, event),
          setSelectObject: (event) => _setSelectObject(emit, event),
        );
      },
    );
  }

  Future<void> _getSearchResult(Emitter<MapSearchState> emit) async {
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
            (item) => SuggestResponseItem(
              title: item.name,
              displayText: item.toponymMetadata!.address.formattedAddress,
              point: item.toponymMetadata!.balloonPoint,
            ),
          )
          .toList();
      emit(MapSearchState.success(results: results));
      session.close();
    } catch (e) {
      emit(MapSearchState.failure(message: e.toString()));
    }
  }

  Future<void> _pointChanged(
      Emitter<MapSearchState> emit, _PointChanged event) async {
    point = event.point;
  }

  Future<void> _setSelectObject(
      Emitter<MapSearchState> emit, _SetSelectObject event) async {
    selectedObject = event.item;
    emit(MapSearchState.selectedObjectBySearching(
        selectedObject: selectedObject!));
  }
}
