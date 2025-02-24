import 'package:dogs_and_cats/domain/models/person_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'person_auth.freezed.dart';
part 'person_auth.g.dart';

@freezed
class PersonAuthModel with _$PersonAuthModel {
  const PersonAuthModel._();

  const factory PersonAuthModel(
      {required String id,
      required String firstName,
      required String lastName,
      required String email,
      required String password}) = _PersonAuthModel;

  PersonAuth toDomain() => PersonAuth(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password);

  factory PersonAuthModel.fromDomain(PersonAuth object) => PersonAuthModel(
      id: object.id,
      firstName: object.firstName,
      lastName: object.lastName,
      email: object.email,
      password: object.password);

  factory PersonAuthModel.fromJson(Map<String, dynamic> json) =>
      _$PersonAuthModelFromJson(json);
}
