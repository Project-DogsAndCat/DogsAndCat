import 'package:dogs_and_cats/domain/models/service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_dto.g.dart';

@JsonSerializable()
class ServiceDto {
  final String id;
  final String title;
  final String price;
  ServiceDto({
    required this.id,
    required this.title,
    required this.price,
  });

  Service toDomain() => Service(
        id: id,
        title: title,
        price: price,
      );

  factory ServiceDto.fromDomain(Service object) => ServiceDto(
        id: object.id,
        title: object.title,
        price: object.price,
      );

  factory ServiceDto.fromJson(Map<String, dynamic> json) =>
      _$ServiceDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceDtoToJson(this);
}
