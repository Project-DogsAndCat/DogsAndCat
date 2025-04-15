import 'package:dogs_and_cats/domain/models/pet.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pet_dto.g.dart';

@JsonSerializable()
class PetDto {
  PetDto({
    this.personId,
    required this.name,
    required this.breed,
    required this.dateBhD,
    required this.gender,
    required this.selectedCategory,
    required this.otherFeatures,
    required this.weight,
    this.id,
  });

  @JsonKey(name: 'person_id')
  String? personId;
  final String? id;
  final String name;
  final String breed;
  @JsonKey(name: 'date_bhd')
  final DateTime dateBhD;
  final int weight;
  final String gender;
  @JsonKey(name: 'selected_category')
  final String selectedCategory;
  @JsonKey(name: 'other_features')
  final String otherFeatures;

  Pet toDomain() => Pet(
      id: id,
      name: name,
      breed: breed,
      dateBhD: dateBhD,
      weight: weight,
      gender: gender,
      selectedCategory: selectedCategory,
      otherFeatures: otherFeatures);

  factory PetDto.fromDomain(Pet object) => PetDto(
      id: object.id,
      name: object.name,
      breed: object.breed,
      dateBhD: object.dateBhD,
      weight: object.weight,
      gender: object.gender,
      selectedCategory: object.selectedCategory,
      otherFeatures: object.otherFeatures);

  factory PetDto.fromJson(Map<String, dynamic> json) => _$PetDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PetDtoToJson(this);
}
