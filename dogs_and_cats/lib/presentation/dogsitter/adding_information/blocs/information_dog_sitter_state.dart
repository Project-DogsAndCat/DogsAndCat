part of 'information_dog_sitter_bloc.dart';

@freezed
class InformationDogSitterState with _$InformationDogSitterState {
  const factory InformationDogSitterState.initial() = _Initial;
  const factory InformationDogSitterState.loading() = _Loading;
  const factory InformationDogSitterState.loaded({
    required Dogsitter dogsitter,
  }) = _Loaded;
  const factory InformationDogSitterState.failure({required String message}) =
      _Failure;
}
