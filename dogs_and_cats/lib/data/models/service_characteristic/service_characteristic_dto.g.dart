// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_characteristic_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceCharacteristicDto _$ServiceCharacteristicDtoFromJson(
        Map<String, dynamic> json) =>
    ServiceCharacteristicDto(
      id: json['id'] as String,
      time: json['time'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$ServiceCharacteristicDtoToJson(
        ServiceCharacteristicDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'time': instance.time,
      'price': instance.price,
    };
