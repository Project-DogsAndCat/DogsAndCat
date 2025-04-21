import 'package:dogs_and_cats/data/models/order/order_dto.dart';
import 'package:dogs_and_cats/data/models/person/person_dto.dart';
import 'package:dogs_and_cats/data/models/service/service_dto.dart';
import 'package:dogs_and_cats/domain/models/task.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/models/order.dart';
part 'task_dto.g.dart';

@JsonSerializable()
class TaskDto {
  TaskDto({
    required this.orderId,
    required this.serviceId,
    required this.date,
    required this.status,
    required this.duration,
    required this.price,
    required this.person,
    required this.service,
  });
  @JsonKey(name: 'id')
  final String orderId;
  @JsonKey(name: 'service_id')
  final String serviceId;
  final DateTime date;
  final String status;
  final String duration;
  final double price;
  final PersonDto person;
  @JsonKey(name: 'services')
  final ServiceDto service;

  Status getStatusOrder({required String status}) {
    return Status.values.firstWhere((value) => value.value == status,
        orElse: () => Status.waiting);
  }

  Task toDomain() => Task(
        serviceTitle: service.title,
        order: OrderDto(
                serviceId: serviceId,
                duration: duration,
                price: price,
                date: date,
                status: status)
            .toDomain(),
        person: person.toDomain(),
      );

  // factory TaskDto.fromDomain(Task object) => TaskDto(
  //       serviceTitle: object.,
  //       order: OrderDto.fromDomain(object.order),
  //       person: PersonDto.fromDomain(object.person),
  //     );

  factory TaskDto.fromJson(Map<String, dynamic> json) =>
      _$TaskDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TaskDtoToJson(this);
}
