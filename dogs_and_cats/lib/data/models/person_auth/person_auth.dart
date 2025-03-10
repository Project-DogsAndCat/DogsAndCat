import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/person_auth.dart';

part 'person_auth.g.dart';

@JsonSerializable()
class PersonAuthModel {
  PersonAuthModel({
    required this.id,
    required this.email,
  });

  final String id;
  final String email;

  PersonAuth toDomain() => PersonAuth(id: id, email: email);

  factory PersonAuthModel.fromDomain(PersonAuth object) =>
      PersonAuthModel(id: object.id, email: object.email);

  factory PersonAuthModel.fromJson(Map<String, dynamic> json) =>
      _$PersonAuthModelFromJson(json);

  Map<String, dynamic> toJson() => _$PersonAuthModelToJson(this);
}
