// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_breed_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DogBreedDto _$DogBreedDtoFromJson(Map<String, dynamic> json) => DogBreedDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$DogBreedDtoToJson(DogBreedDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
