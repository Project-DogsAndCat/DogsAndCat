part of 'dog_breed_bloc.dart';

@freezed
class DogBreedEvent with _$DogBreedEvent {
  const factory DogBreedEvent.load() = _Load;
  const factory DogBreedEvent.runFilter({required String query}) = _RunFilter;
}
