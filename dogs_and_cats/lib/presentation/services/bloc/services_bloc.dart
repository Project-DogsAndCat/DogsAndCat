import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_event.dart';
part 'search_state.dart';

part 'search_bloc.freezed.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchState.success()) {
    on<SearchEvent>((event, emit) async {
      await event.map(loaded: (event) => _loaded(emit));
    });
  }

  Future<void> _loaded(Emitter<SearchState> emit) async {
    emit(SearchState.success());
  }
}
