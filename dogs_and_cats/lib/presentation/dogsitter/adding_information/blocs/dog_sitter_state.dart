part of 'dog_sitter_bloc.dart';

@freezed
class DogSitterState with _$DogSitterState {
  const factory DogSitterState.initial() = _Initial;
  const factory DogSitterState.loading() = _Loading;
  const factory DogSitterState.loaded({
    required Dogsitter dogsitter,
  }) = _Loaded;
  const factory DogSitterState.failure({required String message}) = _Failure;
}
