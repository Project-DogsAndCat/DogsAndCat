class Person {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? role;
  final double? latitude;
  final double? longitude;
  final double? rating;
  final String? serviceId;
  final Status? status;
  Person({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.latitude,
    this.longitude,
    this.rating,
    this.serviceId,
    this.status,
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
    Status? status,
  }) {
    return Person(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      role: role ?? this.role,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      rating: rating ?? this.rating,
      status: status ?? this.status,
    );
  }
}

enum Status {
  busy('Занят'),
  free('Свободен');

  const Status(this.value);
  final String value;
}
