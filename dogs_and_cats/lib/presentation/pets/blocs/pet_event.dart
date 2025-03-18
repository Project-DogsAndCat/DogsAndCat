part of 'pet_bloc.dart';

@freezed
class PetEvent with _$PetEvent {
  const factory PetEvent.load() = _Load;
  const factory PetEvent.add({required Pet pet}) = _Add;
  const factory PetEvent.edit({required String id, required String weight}) =
      _Edit;
}
