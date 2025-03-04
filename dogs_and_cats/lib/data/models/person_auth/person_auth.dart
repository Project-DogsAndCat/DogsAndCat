import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/person_auth/person_auth.dart';
part 'person_auth.g.dart';

@JsonSerializable()
class PersonAuthModel {
  PersonAuthModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  final String id;
  final String firstName;
  final String lastName;
  final String email;

  PersonAuth toDomain() => PersonAuth(
      id: id, firstName: firstName, lastName: lastName, email: email);

  factory PersonAuthModel.fromDomain(PersonAuth object) => PersonAuthModel(
      id: object.id,
      firstName: object.firstName,
      lastName: object.lastName,
      email: object.email);

  factory PersonAuthModel.fromJson(Map<String, dynamic> json) =>
      _$PersonAuthModelFromJson(json);

  Map<String, dynamic> toJson() => _$PersonAuthModelToJson(this);
}
