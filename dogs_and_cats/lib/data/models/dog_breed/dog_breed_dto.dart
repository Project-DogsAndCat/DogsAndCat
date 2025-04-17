import 'package:dogs_and_cats/domain/models/dog_breed.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dog_breed_dto.g.dart';

@JsonSerializable()
class DogBreedDto {
  DogBreedDto({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  DogBreed toDomain() => DogBreed(
        id: id,
        name: name,
      );

  factory DogBreedDto.fromJson(Map<String, dynamic> json) =>
      _$DogBreedDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DogBreedDtoToJson(this);
}
