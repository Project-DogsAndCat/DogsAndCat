import 'package:dogs_and_cats/domain/models/pet.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pet_edit_dto.g.dart';

@JsonSerializable()
class PetEditDto {
  PetEditDto(
      {required this.id,
      required this.weight,
      required this.selectedCategory,
      required this.otherFeatures});

  final String id;
  final int weight;
  @JsonKey(name: 'selected_category')
  final String selectedCategory;
  @JsonKey(name: 'other_features')
  final String otherFeatures;

  PetEdit toDomain() => PetEdit(
      id: id,
      weight: weight,
      selectedCategory: selectedCategory,
      otherFeatures: otherFeatures);

  factory PetEditDto.fromDomain(PetEdit object) => PetEditDto(
      id: object.id,
      weight: object.weight,
      selectedCategory: object.selectedCategory,
      otherFeatures: object.otherFeatures);

  factory PetEditDto.fromJson(Map<String, dynamic> json) =>
      _$PetEditDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PetEditDtoToJson(this);
}
