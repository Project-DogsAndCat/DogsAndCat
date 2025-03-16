// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PetDto _$PetDtoFromJson(Map<String, dynamic> json) => PetDto(
      id: json['id'] as String?,
      name: json['name'] as String?,
      bread: json['bread'] as String?,
      age: (json['age'] as num?)?.toInt(),
      weight: (json['weight'] as num?)?.toDouble(),
      gender: json['gender'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$PetDtoToJson(PetDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'bread': instance.bread,
      'age': instance.age,
      'weight': instance.weight,
      'gender': instance.gender,
      'description': instance.description,
    };
