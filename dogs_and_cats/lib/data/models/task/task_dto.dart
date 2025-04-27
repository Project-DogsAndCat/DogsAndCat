import 'package:dogs_and_cats/data/models/order/order_dto.dart';
import 'package:dogs_and_cats/data/models/person/person_dto.dart';
import 'package:dogs_and_cats/data/models/pet/pet_dto.dart';
import 'package:dogs_and_cats/data/models/service/service_dto.dart';
import 'package:dogs_and_cats/domain/models/task.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/models/order.dart';
part 'task_dto.g.dart';

@JsonSerializable()
class TaskDto {
  TaskDto({
    required this.orderId,
    required this.date,
    required this.status,
    required this.duration,
    required this.price,
    required this.person,
    required this.service,
    required this.pet,
  });
  @JsonKey(name: 'order_id')
  final String orderId;
  final DateTime date;
  final String status;
  final String duration;
  final double price;
  final PersonDto person;
  final ServiceDto service;
  @JsonKey(name: 'pets')
  final List<PetDto> pet;

  Status getStatusOrder({required String status}) {
    return Status.values.firstWhere((value) => value.value == status,
        orElse: () => Status.waiting);
  }

  TaskModel toDomain() => TaskModel(
        serviceTitle: service.title,
        order: OrderDto(
                id: orderId,
                serviceId: service.id,
                duration: duration,
                price: price,
                date: date,
                status: status)
            .toDomain(),
        person: person.toDomain(),
        pet: pet.map((element) => element.toDomain()).toList(),
      );

  factory TaskDto.fromJson(Map<String, dynamic> json) =>
      _$TaskDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TaskDtoToJson(this);
}
