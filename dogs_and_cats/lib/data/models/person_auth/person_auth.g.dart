// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PersonAuthModelImpl _$$PersonAuthModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PersonAuthModelImpl(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$PersonAuthModelImplToJson(
        _$PersonAuthModelImpl instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'password': instance.password,
    };
