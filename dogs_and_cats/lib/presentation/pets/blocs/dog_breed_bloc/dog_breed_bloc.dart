import 'package:bloc/bloc.dart';
import 'package:dogs_and_cats/domain/repositories/dog_breed_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/dog_breed.dart';

part 'dog_breed_bloc.freezed.dart';
part 'dog_breed_event.dart';
part 'dog_breed_state.dart';

class DogBreedBloc extends Bloc<DogBreedEvent, DogBreedState> {
  DogBreedRepository repository;
  DogBreedBloc({required this.repository})
      : super(const DogBreedState.initial()) {
    on<DogBreedEvent>((event, emit) async {
      await event.map(
          load: (_) => _load(emit),
          runFilter: (event) => _runFilter(emit, event));
    });
  }

  Future<void> _load(Emitter<DogBreedState> emit) async {
    emit(DogBreedState.loading());
    final result = await repository.getDogBreed();
    result.fold(
        (failure) => emit(DogBreedState.failure(message: failure.message)),
        (dogBreeds) => emit(DogBreedState.success(dogBreeds: dogBreeds)));
  }

  Future<void> _runFilter(Emitter<DogBreedState> emit, _RunFilter event) async {
    emit(DogBreedState.loading());
    final result = repository.getSearchDogBreed(query: event.query);
    result.fold(
        (failure) => emit(DogBreedState.failure(message: failure.message)),
        (dogBreeds) {
      emit(DogBreedState.success(dogBreeds: dogBreeds));
    });
  }
}
