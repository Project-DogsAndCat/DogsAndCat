// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_edit_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PetEditDto _$PetEditDtoFromJson(Map<String, dynamic> json) => PetEditDto(
      id: json['id'] as String,
      weight: (json['weight'] as num).toInt(),
      selectedCategory: json['selected_category'] as String,
      otherFeatures: json['other_features'] as String,
    );

Map<String, dynamic> _$PetEditDtoToJson(PetEditDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'weight': instance.weight,
      'selected_category': instance.selectedCategory,
      'other_features': instance.otherFeatures,
    };
