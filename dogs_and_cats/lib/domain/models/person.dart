class Person {
  final String id;
  final String phone;
  final String role;
  final String? latitude;
  final String? longitude;
  final double? rating;
  Person({
    required this.id,
    required this.phone,
    required this.role,
    this.latitude,
    this.longitude,
    this.rating,
  });
}
