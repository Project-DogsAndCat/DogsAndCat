import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/person_auth.dart';

part 'person_auth_dto.g.dart';

@JsonSerializable()
class PersonAuthDto {
  PersonAuthDto({
    required this.id,
    required this.email,
  });

  final String id;
  final String email;

  PersonAuth toDomain() => PersonAuth(id: id, email: email);

  factory PersonAuthDto.fromDomain(PersonAuth object) =>
      PersonAuthDto(id: object.id, email: object.email);

  factory PersonAuthDto.fromJson(Map<String, dynamic> json) =>
      _$PersonAuthDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PersonAuthDtoToJson(this);
}
