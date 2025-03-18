// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceDto _$ServiceDtoFromJson(Map<String, dynamic> json) => ServiceDto(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$ServiceDtoToJson(ServiceDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
    };
