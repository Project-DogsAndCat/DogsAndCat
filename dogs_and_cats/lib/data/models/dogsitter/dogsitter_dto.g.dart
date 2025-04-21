// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dogsitter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DogsitterDto _$DogsitterDtoFromJson(Map<String, dynamic> json) => DogsitterDto(
      id: json['id'] as String,
      rating: (json['rating'] as num).toDouble(),
      status: json['status'] as String,
      person: PersonDto.fromJson(json['person'] as Map<String, dynamic>),
      serviceIds: (json['service_id'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$DogsitterDtoToJson(DogsitterDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rating': instance.rating,
      'status': instance.status,
      'person': instance.person,
      'service_id': instance.serviceIds,
    };
