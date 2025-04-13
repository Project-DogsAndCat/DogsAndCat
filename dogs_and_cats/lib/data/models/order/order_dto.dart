import 'package:dogs_and_cats/domain/models/order.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_dto.g.dart';

@JsonSerializable()
class OrderDto {
  OrderDto({
    this.id,
    required this.idService,
    this.idPerson,
    required this.duration,
    required this.price,
    required this.date,
    required this.time,
    required this.status,
  });
  final String? id;
  @JsonKey(name: 'id_service')
  final String idService;
  @JsonKey(name: 'id_person')
  String? idPerson;
  final String duration;
  final double price;
  final DateTime date;
  final String time;
  final String status;

  OrderModel toDomain() => OrderModel(
        id: id,
        idService: idService,
        duration: duration,
        price: price,
        date: date,
        time: time,
        status: getStatus(status),
      );

  factory OrderDto.fromDomain(OrderModel object) => OrderDto(
        idService: object.idService,
        duration: object.duration,
        price: object.price,
        date: object.date,
        time: object.time,
        status: object.status.value,
      );

  factory OrderDto.fromJson(Map<String, dynamic> json) =>
      _$OrderDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDtoToJson(this);

  Status getStatus(String priority) {
    return Status.values.firstWhere((item) => item.value == priority);
  }
}
