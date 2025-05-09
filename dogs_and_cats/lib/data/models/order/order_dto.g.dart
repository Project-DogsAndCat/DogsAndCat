// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDto _$OrderDtoFromJson(Map<String, dynamic> json) => OrderDto(
      id: json['id'] as String?,
      personId: json['person_id'] as String?,
      serviceId: json['service_id'] as String,
      duration: json['duration'] as String,
      price: (json['price'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
      status: json['status'] as String,
      score: (json['score'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$OrderDtoToJson(OrderDto instance) => <String, dynamic>{
      'id': instance.id,
      'person_id': instance.personId,
      'service_id': instance.serviceId,
      'duration': instance.duration,
      'price': instance.price,
      'date': instance.date.toIso8601String(),
      'status': instance.status,
      'score': instance.score,
    };
