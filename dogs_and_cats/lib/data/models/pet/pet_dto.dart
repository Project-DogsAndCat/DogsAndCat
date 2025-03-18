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
      this.weight,
      required this.gender,
      this.features});

  String? personId;
  final String name;
  final String breed;
  final int age;
  final double? weight;
  final String gender;
  final String? features;

  Pet toDomain() => Pet(
        name: name,
        breed: breed,
        age: age,
        weight: weight,
        gender: gender,
        features: features,
      );

  factory PetDto.fromDomain(Pet object) => PetDto(
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
