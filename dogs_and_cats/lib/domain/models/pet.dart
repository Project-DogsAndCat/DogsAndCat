class Pet {
  Pet(
      {required this.name,
      required this.breed,
      required this.age,
      required this.gender,
      this.id,
      this.weight,
      this.features,
      this.otherFeatures});

  final String? id;
  final String name;
  final String breed;
  final String age;
  final int? weight;
  final String gender;
  final String? features;
  final String? otherFeatures;
}

class PetEdit {
  PetEdit({required this.id, this.features, this.otherFeatures});

  final String id;
  final String? features;
  final String? otherFeatures;
}
