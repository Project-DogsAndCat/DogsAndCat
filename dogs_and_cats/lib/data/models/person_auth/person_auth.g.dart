// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonAuthModel _$PersonAuthModelFromJson(Map<String, dynamic> json) =>
    PersonAuthModel(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$PersonAuthModelToJson(PersonAuthModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
    };
