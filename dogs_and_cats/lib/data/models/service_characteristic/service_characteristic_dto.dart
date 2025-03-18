import 'package:dogs_and_cats/domain/models/service_characteristics.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_characteristic_dto.g.dart';

@JsonSerializable()
class ServiceCharacteristicDto {
  ServiceCharacteristicDto({
    required this.id,
    required this.time,
    required this.price,
  });
  final String id;
  final String time;
  final double price;

  ServiceCharacteristic toDomain() => ServiceCharacteristic(
        id: id,
        time: time,
        price: price,
      );

  factory ServiceCharacteristicDto.fromDomain(ServiceCharacteristic object) =>
      ServiceCharacteristicDto(
        id: object.id,
        time: object.time,
        price: object.price,
      );

  factory ServiceCharacteristicDto.fromJson(Map<String, dynamic> json) =>
      _$ServiceCharacteristicDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceCharacteristicDtoToJson(this);
}
