import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/models/person/person.dart';
part 'person_model.g.dart';

@JsonSerializable()
class PersonModel {
  PersonModel({
    required this.id,
    required this.phone,
    required this.role,
    this.latitude,
    this.longitude,
    this.rating,
  });
  final String id;
  final String phone;
  final String role;
  final String? latitude;
  final String? longitude;
  final double? rating;

  Person toDomain() => Person(
        id: id,
        phone: phone,
        role: role,
        latitude: latitude,
        longitude: longitude,
        rating: rating,
      );

  factory PersonModel.fromDomain(Person object) => PersonModel(
        id: object.id,
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
