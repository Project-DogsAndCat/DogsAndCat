part of 'dog_breed_bloc.dart';

@freezed
class DogBreedState with _$DogBreedState {
  const factory DogBreedState.initial() = _Initial;
  const factory DogBreedState.loading() = _Loading;
  const factory DogBreedState.success({
    required List<DogBreed> dogBreeds,
  }) = _Success;
  const factory DogBreedState.failure({
    required String message,
  }) = _Failure;
}
