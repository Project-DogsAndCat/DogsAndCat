class Pet {
  Pet({
    required this.name,
    required this.breed,
    required this.dateBhD,
    required this.gender,
    required this.selectedCategory,
    required this.otherFeatures,
    required this.weight,
    this.id,
  });

  final String? id;
  final String name;
  final String breed;
  final DateTime dateBhD;
  final int weight;
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
