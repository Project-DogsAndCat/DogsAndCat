import 'package:dogs_and_cats/data/models/person/person_dto.dart';
import 'package:dogs_and_cats/domain/models/dogsitter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dogsitter_dto.g.dart';

@JsonSerializable()
class DogsitterDto {
  DogsitterDto({
    required this.id,
    required this.rating,
    required this.status,
    required this.person,
    required this.serviceIds,
  });
  final String id;
  final double rating;
  final String status;
  final PersonDto person;
  @JsonKey(name: 'service_id')
  final List<String> serviceIds;

  StatusDogSitter getStatus(String? status) {
    return StatusDogSitter.values.firstWhere(
      (item) => item.value == status,
      orElse: () => StatusDogSitter.free,
    );
  }

  Dogsitter toDomain() => Dogsitter(
        id: id,
        rating: rating,
        status: getStatus(status),
        person: person.toDomain(),
        serviceIds: serviceIds,
      );

  factory DogsitterDto.fromDomain(Dogsitter object) => DogsitterDto(
        id: object.id,
        rating: object.rating,
        status: object.status.value,
        person: PersonDto.fromDomain(object.person),
        serviceIds: object.serviceIds,
      );

  factory DogsitterDto.fromJson(Map<String, dynamic> json) =>
      _$DogsitterDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DogsitterDtoToJson(this);
}
