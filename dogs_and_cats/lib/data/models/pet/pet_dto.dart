import 'package:dogs_and_cats/domain/models/pet.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pet_dto.g.dart';

@JsonSerializable()
class PetDto {
  PetDto(
      {required this.id,
      required this.name,
      required this.bread,
      required this.age,
      required this.weight,
      required this.gender,
      required this.description});

  final String? id;
  final String? name;
  final String? bread;
  final int? age;
  final double? weight;
  final String? gender;
  final String? description;

  Pet toDomain() => Pet(
        id: id,
        name: name,
        bread: bread,
        age: age,
        weight: weight,
        gender: gender,
        description: description,
      );

  factory PetDto.fromDomain(Pet object) => PetDto(
        id: object.id,
        name: object.name,
        bread: object.bread,
        age: object.age,
        weight: object.weight,
        gender: object.gender,
        description: object.description,
      );

  factory PetDto.fromJson(Map<String, dynamic> json) => _$PetDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PetDtoToJson(this);
}
