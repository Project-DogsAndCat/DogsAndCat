import 'package:json_annotation/json_annotation.dart';

part 'point_dto.g.dart';

@JsonSerializable()
class PointDto {
  PointDto({
    this.latitude,
    this.longitude,
  });
  final double? latitude;
  final double? longitude;

  factory PointDto.fromJson(Map<String, dynamic> json) =>
      _$PointDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PointDtoToJson(this);
}
