class Person {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? role;
  final double? latitude;
  final double? longitude;
  Person({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.latitude,
    this.longitude,
  });

  Person copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? role,
    double? latitude,
    double? longitude,
    double? rating,
    String? position,
  }) {
    return Person(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      role: role ?? this.role,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
}
