part of 'pet_edit_cubit.dart';

class PetEditState {
  PetEditState({required this.features, required this.otherFeatures});

  final Set<String> features;
  final String otherFeatures;

  PetEditState copyWith(Set<String>? features, String? otherFeatures) {
    return PetEditState(
        features: features ?? this.features,
        otherFeatures: otherFeatures ?? this.otherFeatures);
  }
}
