import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dogs_and_cats/domain/models/dogsitter.dart';
import 'package:dogs_and_cats/domain/repositories/become_dogsitter_repository.dart';
import 'package:dogs_and_cats/domain/repositories/dog_sitter_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/service.dart';

part 'dog_sitter_bloc.freezed.dart';
part 'dog_sitter_event.dart';
part 'dog_sitter_state.dart';

class DogSitterBloc extends Bloc<DogSitterEvent, DogSitterState> {
  final DogSitterRepository dogSitterrepository;
  final BecomeDogsitterRepository becomeDogsitterRepository;

  DogSitterBloc({
    required this.dogSitterrepository,
    required this.becomeDogsitterRepository,
  }) : super(const DogSitterState.initial()) {
    on<DogSitterEvent>((event, emit) async {
      await event.map(
        load: (_) => _load(emit),
        selectPositions: (event) => _selectPositions(emit, event),
        updateStatus: (event) => _updateStatus(emit, event),
        addImage: (event) => _addImage(emit, event),
      );
    });
  }

  Future<void> _load(Emitter<DogSitterState> emit) async {
    emit(DogSitterState.loading());
    final result = await dogSitterrepository.getDogsitter();

    result.fold(
        (failure) => emit(DogSitterState.failure(message: failure.message)),
        (dogsitter) {
      emit(DogSitterState.loaded(dogsitter: dogsitter));
    });
  }

  Future<void> _selectPositions(
      Emitter<DogSitterState> emit, _SelectPositions event) async {
    emit(DogSitterState.loading());

    final result = await dogSitterrepository.addInformation(
        selectedServices: event.selectedServices);

    result.fold(
        (failure) => emit(DogSitterState.failure(message: failure.message)),
        (_) async {
      final result = await becomeDogsitterRepository.addedInfoFlag();
      result.fold(
          (failure) => emit(DogSitterState.failure(message: failure.message)),
          (_) => add(_Load()));
    });
  }

  Future<void> _addImage(Emitter<DogSitterState> emit, _AddImage event) async {
    final result =
        await dogSitterrepository.addImage(imageBytes: event.imageBytes);

    result.fold(
        (failure) => emit(DogSitterState.failure(message: failure.message)),
        (_) => add(_Load()));
  }

  Future<void> _updateStatus(
      Emitter<DogSitterState> emit, _UpdateStatus event) async {
    emit(DogSitterState.loading());

    final result = await dogSitterrepository.updateStatus(status: event.status);

    result.fold(
        (failure) => emit(DogSitterState.failure(message: failure.message)),
        (_) => add(_Load()));
  }
}
