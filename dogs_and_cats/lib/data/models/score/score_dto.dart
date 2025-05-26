import 'package:json_annotation/json_annotation.dart';
import '../../../domain/models/score.dart';
part 'score_dto.g.dart';

@JsonSerializable()
class ScoreDto {
  ScoreDto({
    this.id,
    required this.score,
    required this.orderId,
    required this.dogsitterId,
  });
  final String? id;
  final double score;
  @JsonKey(name: 'order_id')
  final String orderId;
  @JsonKey(name: 'dogsitter_id')
  final String dogsitterId;

  Score toDomain() => Score(
        id: id,
        score: score,
        orderId: orderId,
        dogsitterId: dogsitterId,
      );

  factory ScoreDto.fromDomain(Score object) => ScoreDto(
        id: object.id,
        score: object.score,
        orderId: object.orderId,
        dogsitterId: object.dogsitterId,
      );

  factory ScoreDto.fromJson(Map<String, dynamic> json) =>
      _$ScoreDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ScoreDtoToJson(this);
}
