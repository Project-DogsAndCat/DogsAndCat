// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskDto _$TaskDtoFromJson(Map<String, dynamic> json) => TaskDto(
      service: ServiceDto.fromJson(json['service'] as Map<String, dynamic>),
      order: OrderDto.fromJson(json['order'] as Map<String, dynamic>),
      person: PersonDto.fromJson(json['person'] as Map<String, dynamic>),
      dogsitter: json['dogsitter'] == null
          ? null
          : DogsitterDto.fromJson(json['dogsitter'] as Map<String, dynamic>),
      pets: (json['pets'] as List<dynamic>)
          .map((e) => PetDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      score: json['score'] == null
          ? null
          : ScoreDto.fromJson(json['score'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TaskDtoToJson(TaskDto instance) => <String, dynamic>{
      'service': instance.service,
      'order': instance.order,
      'person': instance.person,
      'dogsitter': instance.dogsitter,
      'pets': instance.pets,
      'score': instance.score,
    };
