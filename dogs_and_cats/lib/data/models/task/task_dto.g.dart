// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskDto _$TaskDtoFromJson(Map<String, dynamic> json) => TaskDto(
      orderId: json['order_id'] as String,
      date: DateTime.parse(json['date'] as String),
      status: json['status'] as String,
      duration: json['duration'] as String,
      price: (json['price'] as num).toDouble(),
      person: PersonDto.fromJson(json['person'] as Map<String, dynamic>),
      service: ServiceDto.fromJson(json['service'] as Map<String, dynamic>),
      pet: (json['pets'] as List<dynamic>)
          .map((e) => PetDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TaskDtoToJson(TaskDto instance) => <String, dynamic>{
      'order_id': instance.orderId,
      'date': instance.date.toIso8601String(),
      'status': instance.status,
      'duration': instance.duration,
      'price': instance.price,
      'person': instance.person,
      'service': instance.service,
      'pets': instance.pet,
    };
