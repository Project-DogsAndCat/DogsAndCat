part of 'pet_edit_cubit.dart';

class PetEditState {
  PetEditState({required this.selectedCategory, required this.otherFeatures});

  final Set<String>? selectedCategory;
  final String? otherFeatures;
  String? get selectedCategoryString => selectedCategory
      ?.toString()
      .substring(1, selectedCategory.toString().length - 1);

  PetEditState copyWith(
      {Set<String>? selectedCategory, required String otherFeatures}) {
    return PetEditState(
        selectedCategory: selectedCategory, otherFeatures: otherFeatures);
  }
}
