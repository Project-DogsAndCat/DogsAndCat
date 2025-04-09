import 'package:dogs_and_cats/domain/models/person.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'person_dto.g.dart';

@JsonSerializable()
class PersonDto {
  PersonDto({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.latitude,
    this.longitude,
  });
  final String? id;
  @JsonKey(name: 'first_name')
  final String? firstName;
  @JsonKey(name: 'last_name')
  final String? lastName;
  final String? email;
  final String? phone;
  final String? role;
  final double? latitude;
  final double? longitude;

  Person toDomain() => Person(
        id: id,
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
        role: role,
        latitude: latitude,
        longitude: longitude,
      );

  factory PersonDto.fromDomain(Person object) => PersonDto(
        id: object.id,
        firstName: object.firstName,
        lastName: object.lastName,
        email: object.email,
        phone: object.phone,
        role: object.role,
        latitude: object.latitude,
        longitude: object.longitude,
      );

  factory PersonDto.fromJson(Map<String, dynamic> json) =>
      _$PersonDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PersonDtoToJson(this);

  // bool isValidatingPhone() {
  //   if (phone == null) return false;
  //   if (!ValidationRules.phoneValidation.hasMatch(phone!)) {
  //     throw Exception(AppString.providedValidPhone);
  //   }
  //   return true;
  // }
}
