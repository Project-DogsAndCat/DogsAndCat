part of 'dog_sitter_cubit.dart';

@freezed
class DogSitterState with _$DogSitterState {
  const factory DogSitterState.loading() = _Loading;
  const factory DogSitterState.loaded({required Dogsitter dogsitter}) = _Loaded;
  const factory DogSitterState.failure({required String message}) = _Failure;
}
