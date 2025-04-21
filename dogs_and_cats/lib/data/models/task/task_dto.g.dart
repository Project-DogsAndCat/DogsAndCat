// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskDto _$TaskDtoFromJson(Map<String, dynamic> json) => TaskDto(
      orderId: json['id'] as String,
      serviceId: json['service_id'] as String,
      date: DateTime.parse(json['date'] as String),
      status: json['status'] as String,
      duration: json['duration'] as String,
      price: (json['price'] as num).toDouble(),
      person: PersonDto.fromJson(json['person'] as Map<String, dynamic>),
      service: ServiceDto.fromJson(json['services'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TaskDtoToJson(TaskDto instance) => <String, dynamic>{
      'id': instance.orderId,
      'service_id': instance.serviceId,
      'date': instance.date.toIso8601String(),
      'status': instance.status,
      'duration': instance.duration,
      'price': instance.price,
      'person': instance.person,
      'services': instance.service,
    };
