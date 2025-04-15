import 'package:dogs_and_cats/domain/models/order.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_dto.g.dart';

@JsonSerializable()
class OrderDto {
  OrderDto({
    this.id,
    this.personId,
    required this.serviceId,
    required this.duration,
    required this.price,
    required this.date,
    required this.status,
  });
  final String? id;
  @JsonKey(name: 'person_id')
  String? personId;
  @JsonKey(name: 'service_id')
  final String serviceId;
  final String duration;
  final double price;
  final DateTime date;
  final String status;

  OrderModel toDomain() => OrderModel(
        id: id,
        serviceId: serviceId,
        duration: duration,
        price: price,
        date: date,
        status: getStatus(status),
      );

  factory OrderDto.fromDomain(OrderModel object) => OrderDto(
        serviceId: object.serviceId,
        duration: object.duration,
        price: object.price,
        date: object.date,
        status: object.status!.value,
      );

  Status getStatus(String priority) {
    return Status.values.firstWhere((item) => item.value == priority);
  }

  factory OrderDto.fromJson(Map<String, dynamic> json) =>
      _$OrderDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDtoToJson(this);
}
