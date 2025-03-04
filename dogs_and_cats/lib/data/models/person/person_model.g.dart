// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonModel _$PersonModelFromJson(Map<String, dynamic> json) => PersonModel(
      id: json['id'] as String,
      phone: json['phone'] as String,
      role: json['role'] as String,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PersonModelToJson(PersonModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phone': instance.phone,
      'role': instance.role,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'rating': instance.rating,
    };
