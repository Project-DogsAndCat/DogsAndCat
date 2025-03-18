class Pet {
  Pet(
      {required this.name,
      required this.breed,
      required this.age,
      this.weight,
      required this.gender,
      this.features});

  final String name;
  final String breed;
  final int age;
  final double? weight;
  final String gender;
  final String? features;
}
