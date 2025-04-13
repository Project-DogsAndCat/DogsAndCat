// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDto _$OrderDtoFromJson(Map<String, dynamic> json) => OrderDto(
      id: json['id'] as String?,
      idService: json['id_service'] as String,
      idPerson: json['id_person'] as String?,
      duration: json['duration'] as String,
      price: (json['price'] as num).toDouble(),
      date: json['date'] as String,
      time: json['time'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$OrderDtoToJson(OrderDto instance) => <String, dynamic>{
      'id': instance.id,
      'id_service': instance.idService,
      'id_person': instance.idPerson,
      'duration': instance.duration,
      'price': instance.price,
      'date': instance.date,
      'time': instance.time,
      'status': instance.status,
    };
