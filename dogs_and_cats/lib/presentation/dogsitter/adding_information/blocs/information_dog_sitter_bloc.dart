import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dogs_and_cats/domain/repositories/dog_sitter_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/person.dart';

part 'information_dog_sitter_bloc.freezed.dart';
part 'information_dog_sitter_event.dart';
part 'information_dog_sitter_state.dart';

class InformationDogSitterBloc
    extends Bloc<InformationDogSitterEvent, InformationDogSitterState> {
  final DogSitterRepository repository;
  InformationDogSitterBloc({required this.repository})
      : super(const InformationDogSitterState.initial()) {
    on<InformationDogSitterEvent>((event, emit) async {
      await event.map(
        load: (_) => _load(emit),
        addInformation: (event) => _addInformation(emit, event),
        addImage: (event) => _addImage(emit, event),
      );
    });
  }

  Future<void> _load(Emitter<InformationDogSitterState> emit) async {
    emit(InformationDogSitterState.loading());
    final result = await repository.getPerson();

    result.fold(
        (failure) =>
            emit(InformationDogSitterState.failure(message: failure.message)),
        (person) => emit(InformationDogSitterState.loaded(person: person)));
  }

  Future<void> _addInformation(
      Emitter<InformationDogSitterState> emit, _AddInformation event) async {
    emit(InformationDogSitterState.loading());

    final result = await repository.addInformation(position: event.position);

    result.fold(
        (failure) =>
            emit(InformationDogSitterState.failure(message: failure.message)),
        (_) => add(_Load()));
  }

  Future<void> _addImage(
      Emitter<InformationDogSitterState> emit, _AddImage event) async {
    final result = await repository.addImage(imageBytes: event.imageBytes);

    result.fold(
        (failure) =>
            emit(InformationDogSitterState.failure(message: failure.message)),
        (_) => add(_Load()));
  }
}
