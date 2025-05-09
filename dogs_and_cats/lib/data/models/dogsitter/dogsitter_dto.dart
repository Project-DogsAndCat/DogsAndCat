import 'package:dogs_and_cats/data/models/person/person_dto.dart';
import 'package:dogs_and_cats/data/models/service/service_dto.dart';
import 'package:dogs_and_cats/domain/models/dogsitter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dogsitter_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class DogsitterDto {
  DogsitterDto({
    required this.id,
    this.rating,
    this.status,
    required this.person,
    this.services,
  });

  @JsonKey(name: 'dogsitter_id')
  final String id;

  @JsonKey(name: 'rating')
  final double? rating;

  @JsonKey(name: 'status')
  final String? status;

  @JsonKey(name: 'person')
  final PersonDto person;

  @JsonKey(name: 'services')
  final List<ServiceDto>? services;

  StatusDogSitter getStatus(String? status) {
    return StatusDogSitter.values.firstWhere(
      (item) => item.value == status,
      orElse: () => StatusDogSitter.free,
    );
  }

  Dogsitter toDomain() => Dogsitter(
        id: id,
        rating: rating ?? 0.0,
        status: getStatus(status),
        person: person.toDomain(),
        serviceIds: services?.map((element) => element.toDomain()).toList(),
      );

  factory DogsitterDto.fromDomain(Dogsitter object) => DogsitterDto(
        id: object.id,
        rating: object.rating,
        status: object.status.value,
        person: PersonDto.fromDomain(object.person),
        services: object.serviceIds
            ?.map((element) => ServiceDto.fromDomain(element))
            .toList(),
      );

  factory DogsitterDto.fromJson(Map<String, dynamic> json) =>
      _$DogsitterDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DogsitterDtoToJson(this);
}
