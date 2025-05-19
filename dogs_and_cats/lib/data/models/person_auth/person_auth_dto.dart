import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/person_auth.dart';

part 'person_auth_dto.g.dart';

@JsonSerializable()
class PersonAuthDto {
  PersonAuthDto({
    required this.id,
    required this.email,
    required this.role,
    required this.isAddedInfo,
  });

  final String id;
  final String email;
  @JsonKey(name: 'role_user')
  final String role;
  @JsonKey(name: 'is_added_info')
  final bool isAddedInfo;

  PersonAuth toDomain() => PersonAuth(
        id: id,
        email: email,
        role: role,
        isAddedInfo: isAddedInfo,
      );

  factory PersonAuthDto.fromDomain(PersonAuth object) => PersonAuthDto(
        id: object.id,
        email: object.email,
        role: object.role,
        isAddedInfo: object.isAddedInfo,
      );

  factory PersonAuthDto.fromJson(Map<String, dynamic> json) =>
      _$PersonAuthDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PersonAuthDtoToJson(this);
}
