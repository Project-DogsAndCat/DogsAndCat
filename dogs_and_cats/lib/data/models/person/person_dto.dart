import 'package:dogs_and_cats/domain/models/person.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'person_dto.g.dart';

@JsonSerializable()
class PersonDto {
  PersonDto(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.role,
      this.latitude,
      this.longitude,
      this.rating,
      this.serviceId,
      this.status});
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
  final double? rating;
  @JsonKey(name: 'service_id')
  final String? serviceId;
  final String? status;

  Status getStatus(String? status) {
    return Status.values.firstWhere(
      (item) => item.value == status,
      orElse: () => Status.free,
    );
  }

  Person toDomain() => Person(
        id: id,
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
        role: role,
        latitude: latitude,
        longitude: longitude,
        rating: rating,
        serviceId: serviceId,
        status: getStatus(status),
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
        rating: object.rating,
        serviceId: object.serviceId,
        status: object.status?.value,
      );

  factory PersonDto.fromJson(Map<String, dynamic> json) =>
      _$PersonDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PersonDtoToJson(this);
}
