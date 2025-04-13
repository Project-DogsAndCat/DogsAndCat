import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/person.dart';

part 'information_dog_sitter_bloc.freezed.dart';
part 'information_dog_sitter_event.dart';
part 'information_dog_sitter_state.dart';

class InformationDogSitterBloc
    extends Bloc<InformationDogSitterEvent, InformationDogSitterState> {
  InformationDogSitterBloc()
      : super(const InformationDogSitterState.loading()) {
    on<InformationDogSitterEvent>((event, emit) async {
      await event.map(
          load: (_) => _load(emit),
          addInformation: (event) => _addInformation(emit, event));
    });
  }

  Future<void> _load(Emitter<InformationDogSitterState> emit) async {}

  Future<void> _addInformation(
      Emitter<InformationDogSitterState> emit, _AddInformation event) async {}
}
