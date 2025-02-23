import 'package:freezed_annotation/freezed_annotation.dart';

part 'person_auth.freezed.dart';

@freezed
class PersonAuth with _$PersonAuth {
  const factory PersonAuth(
      {required String firstName,
      required String lastName,
      required String email,
      required String password}) = _PersonAuth;
}
