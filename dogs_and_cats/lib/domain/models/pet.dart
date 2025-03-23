class Pet {
  Pet({
    required this.name,
    required this.breed,
    required this.age,
    required this.gender,
    required this.selectedCategory,
    required this.otherFeatures,
    this.id,
    this.weight,
  });

  final String? id;
  final String name;
  final String breed;
  final String age;
  final int? weight;
  final String gender;
  final String selectedCategory;
  final String otherFeatures;
}

class PetEdit {
  PetEdit(
      {required this.id,
      required this.selectedCategory,
      required this.otherFeatures});

  final String id;
  final String selectedCategory;
  final String otherFeatures;
}
