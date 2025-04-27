// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dogsitter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DogsitterDto _$DogsitterDtoFromJson(Map<String, dynamic> json) => DogsitterDto(
      id: json['dogsitter_id'] as String,
      rating: (json['rating'] as num?)?.toDouble(),
      status: json['status'] as String?,
      person: PersonDto.fromJson(json['person'] as Map<String, dynamic>),
      services: (json['services'] as List<dynamic>)
          .map((e) => ServiceDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DogsitterDtoToJson(DogsitterDto instance) =>
    <String, dynamic>{
      'dogsitter_id': instance.id,
      'rating': instance.rating,
      'status': instance.status,
      'person': instance.person.toJson(),
      'services': instance.services.map((e) => e.toJson()).toList(),
    };
