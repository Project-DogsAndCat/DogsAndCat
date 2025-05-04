import 'package:dogs_and_cats/data/models/order/order_dto.dart';
import 'package:dogs_and_cats/data/models/person/person_dto.dart';
import 'package:dogs_and_cats/data/models/pet/pet_dto.dart';
import 'package:dogs_and_cats/data/models/service/service_dto.dart';
import 'package:dogs_and_cats/domain/models/task.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/models/order.dart';
import '../dogsitter/dogsitter_dto.dart';

part 'task_dto.g.dart';

@JsonSerializable()
class TaskDto {
  TaskDto({
    required this.service,
    required this.order,
    required this.person,
    required this.dogsitter,
    required this.pets,
  });
  final ServiceDto service;
  final OrderDto order;
  final PersonDto person;
  final DogsitterDto? dogsitter;
  final List<PetDto> pets;

  Status getStatusOrder({required String status}) {
    return Status.values.firstWhere((value) => value.value == status,
        orElse: () => Status.waiting);
  }

  TaskModel toDomain() => TaskModel(
        serviceTitle: service.title,
        order: order.toDomain(),
        person: person.toDomain(),
        dogsitter: dogsitter?.toDomain(),
        pet: pets.map((element) => element.toDomain()).toList(),
      );

  factory TaskDto.fromJson(Map<String, dynamic> json) =>
      _$TaskDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TaskDtoToJson(this);
}
