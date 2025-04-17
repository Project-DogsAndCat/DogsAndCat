part of 'pet_bloc.dart';

@freezed
class PetState with _$PetState {
  const factory PetState.loading() = _Loading;
  const factory PetState.loaded({required List<Pet> pets}) = _Loaded;
  const factory PetState.failure({required String message}) = _Failure;
}
