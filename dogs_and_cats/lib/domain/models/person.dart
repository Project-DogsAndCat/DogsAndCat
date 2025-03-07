class Person {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String? phone;
  final String? role;
  final String? latitude;
  final String? longitude;
  final double? rating;
  Person({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.phone,
    this.role,
    this.latitude,
    this.longitude,
    this.rating,
  });
}
