import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dogs_and_cats/domain/models/dogsitter.dart';
import 'package:dogs_and_cats/domain/repositories/dog_sitter_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/service.dart';

part 'dog_sitter_bloc.freezed.dart';
part 'dog_sitter_event.dart';
part 'dog_sitter_state.dart';

class DogSitterBloc extends Bloc<DogSitterEvent, DogSitterState> {
  final DogSitterRepository repository;
  DogSitterBloc({required this.repository})
      : super(const DogSitterState.initial()) {
    on<DogSitterEvent>((event, emit) async {
      await event.map(
        load: (_) => _load(emit),
        selectPositions: (event) => _selectPositions(emit, event),
        updateStatus: (event) => _updateStatus(emit, event),
        addImage: (event) => _addImage(emit, event),
      );
    });
  }

  Dogsitter? _dogsitter;
  Dogsitter? get dogsiterrInfo => _dogsitter;

  Future<void> _load(Emitter<DogSitterState> emit) async {
    emit(DogSitterState.loading());
    final result = await repository.getDogsitter();

    result.fold(
        (failure) => emit(DogSitterState.failure(message: failure.message)),
        (dogsitter) {
      _dogsitter = dogsitter;
      emit(DogSitterState.loaded(dogsitter: dogsitter));
    });
  }

  Future<void> _selectPositions(
      Emitter<DogSitterState> emit, _SelectPositions event) async {
    emit(DogSitterState.loading());

    final result = await repository.addInformation(
        selectedServices: event.selectedServices);

    result.fold(
        (failure) => emit(DogSitterState.failure(message: failure.message)),
        (_) => add(_Load()));
  }

  Future<void> _addImage(Emitter<DogSitterState> emit, _AddImage event) async {
    final result = await repository.addImage(imageBytes: event.imageBytes);

    result.fold(
        (failure) => emit(DogSitterState.failure(message: failure.message)),
        (_) => add(_Load()));
  }

  Future<void> _updateStatus(
      Emitter<DogSitterState> emit, _UpdateStatus event) async {
    emit(DogSitterState.loading());

    final newStatus = _changeStatus(status: event.currentStatus);

    final result = await repository.updateStatus(status: newStatus);

    result.fold(
        (failure) => emit(DogSitterState.failure(message: failure.message)),
        (_) => add(_Load()));
  }

  StatusDogSitter _changeStatus({required StatusDogSitter status}) {
    if (status == StatusDogSitter.busy) {
      return StatusDogSitter.free;
    }
    return StatusDogSitter.busy;
  }
}
