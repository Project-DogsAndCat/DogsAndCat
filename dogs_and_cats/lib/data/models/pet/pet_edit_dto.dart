import 'package:dogs_and_cats/domain/models/pet.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pet_edit_dto.g.dart';

@JsonSerializable()
class PetEditDto {
  PetEditDto(
      {required this.id,
      required this.selectedCategory,
      required this.otherFeatures});

  final String id;
  @JsonKey(name: 'selected_category')
  final String selectedCategory;
  @JsonKey(name: 'other_features')
  final String otherFeatures;

  PetEdit toDomain() => PetEdit(
      id: id, selectedCategory: selectedCategory, otherFeatures: otherFeatures);

  factory PetEditDto.fromDomain(PetEdit object) => PetEditDto(
      id: object.id,
      selectedCategory: object.selectedCategory,
      otherFeatures: object.selectedCategory);

  factory PetEditDto.fromJson(Map<String, dynamic> json) =>
      _$PetEditDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PetEditDtoToJson(this);
}
