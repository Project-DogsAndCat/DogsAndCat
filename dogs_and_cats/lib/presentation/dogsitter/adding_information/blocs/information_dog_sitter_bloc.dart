import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dogs_and_cats/domain/models/dogsitter.dart';
import 'package:dogs_and_cats/domain/repositories/dog_sitter_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/service.dart';

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
        selectPositions: (event) => _selectPositions(emit, event),
        addImage: (event) => _addImage(emit, event),
      );
    });
  }

  Future<void> _load(Emitter<InformationDogSitterState> emit) async {
    emit(InformationDogSitterState.loading());
    final result = await repository.getDogsitter();

    result.fold(
        (failure) =>
            emit(InformationDogSitterState.failure(message: failure.message)),
        (dogsitter) =>
            emit(InformationDogSitterState.loaded(dogsitter: dogsitter)));
  }

  Future<void> _selectPositions(
      Emitter<InformationDogSitterState> emit, _SelectPositions event) async {
    emit(InformationDogSitterState.loading());

    final result = await repository.addInformation(
        selectedServices: event.selectedServices);

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
