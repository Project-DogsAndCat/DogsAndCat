import 'package:dogs_and_cats/domain/models/person.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'person_model.g.dart';

@JsonSerializable()
class PersonModel {
  PersonModel({
    required this.id,
    required this.phone,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.role,
    this.latitude,
    this.longitude,
    this.rating,
  });
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String? phone;
  final String? role;
  final String? latitude;
  final String? longitude;
  final double? rating;

  Person toDomain() => Person(
        id: id,
        phone: phone,
        firstName: firstName,
        lastName: lastName,
        email: email,
        role: role,
        latitude: latitude,
        longitude: longitude,
        rating: rating,
      );

  factory PersonModel.fromDomain(Person object) => PersonModel(
        id: object.id,
        firstName: object.firstName,
        lastName: object.lastName,
        email: object.email,
        phone: object.phone,
        role: object.role,
        latitude: object.latitude,
        longitude: object.longitude,
        rating: object.rating,
      );

  factory PersonModel.fromJson(Map<String, dynamic> json) =>
      _$PersonModelFromJson(json);

  Map<String, dynamic> toJson() => _$PersonModelToJson(this);
}
