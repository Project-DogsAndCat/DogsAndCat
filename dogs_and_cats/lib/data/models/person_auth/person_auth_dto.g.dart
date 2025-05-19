// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_auth_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonAuthDto _$PersonAuthDtoFromJson(Map<String, dynamic> json) =>
    PersonAuthDto(
      id: json['id'] as String,
      email: json['email'] as String,
      role: json['role_user'] as String,
      isAddedInfo: json['is_added_info'] as bool,
    );

Map<String, dynamic> _$PersonAuthDtoToJson(PersonAuthDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'role_user': instance.role,
      'is_added_info': instance.isAddedInfo,
    };
