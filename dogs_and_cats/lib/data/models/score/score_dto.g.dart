// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScoreDto _$ScoreDtoFromJson(Map<String, dynamic> json) => ScoreDto(
      id: json['id'] as String?,
      score: (json['score'] as num).toDouble(),
      orderId: json['order_id'] as String,
      dogsitterId: json['dogsitter_id'] as String,
    );

Map<String, dynamic> _$ScoreDtoToJson(ScoreDto instance) => <String, dynamic>{
      'id': instance.id,
      'score': instance.score,
      'order_id': instance.orderId,
      'dogsitter_id': instance.dogsitterId,
    };
