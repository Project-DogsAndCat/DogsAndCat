import 'package:dogs_and_cats/domain/models/service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_dto.g.dart';

@JsonSerializable()
class ServiceDto {
  final String id;
  final String title;
  final String description;
  final String? image;
  ServiceDto(
      {required this.id,
      required this.title,
      required this.description,
      this.image});

  Service toDomain() => Service(
        id: id,
        title: title,
        description: description,
        image: image,
      );

  factory ServiceDto.fromDomain(Service object) => ServiceDto(
        id: object.id,
        title: object.title,
        description: object.description,
        image: object.image,
      );

  factory ServiceDto.fromJson(Map<String, dynamic> json) =>
      _$ServiceDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceDtoToJson(this);
}
