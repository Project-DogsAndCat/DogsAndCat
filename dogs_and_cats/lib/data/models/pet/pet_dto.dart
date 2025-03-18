import 'package:dogs_and_cats/domain/models/pet.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pet_dto.g.dart';

@JsonSerializable()
class PetDto {
  PetDto(
      {this.personId,
      required this.name,
      required this.breed,
      required this.age,
      required this.gender,
      this.id,
      this.weight,
      this.features});

  @JsonKey(name: 'person_id')
  String? personId;
  final String? id;
  final String name;
  final String breed;
  final String age;
  final int? weight;
  final String gender;
  final String? features;

  Pet toDomain() => Pet(
        id: id,
        name: name,
        breed: breed,
        age: age,
        weight: weight,
        gender: gender,
        features: features,
      );

  factory PetDto.fromDomain(Pet object) => PetDto(
        id: object.id,
        name: object.name,
        breed: object.breed,
        age: object.age,
        weight: object.weight,
        gender: object.gender,
        features: object.features,
      );

  factory PetDto.fromJson(Map<String, dynamic> json) => _$PetDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PetDtoToJson(this);
}
