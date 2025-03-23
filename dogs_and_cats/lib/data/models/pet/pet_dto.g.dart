// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PetDto _$PetDtoFromJson(Map<String, dynamic> json) => PetDto(
      personId: json['person_id'] as String?,
      name: json['name'] as String,
      breed: json['breed'] as String,
      age: json['age'] as String,
      gender: json['gender'] as String,
      selectedCategory: json['selected_category'] as String,
      otherFeatures: json['other_features'] as String,
      id: json['id'] as String?,
      weight: (json['weight'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PetDtoToJson(PetDto instance) => <String, dynamic>{
      'person_id': instance.personId,
      'id': instance.id,
      'name': instance.name,
      'breed': instance.breed,
      'age': instance.age,
      'weight': instance.weight,
      'gender': instance.gender,
      'selected_category': instance.selectedCategory,
      'other_features': instance.otherFeatures,
    };
