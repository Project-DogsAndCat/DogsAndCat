part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  factory AuthEvent.userLogin() = _UserLogin;
  factory AuthEvent.userLogOut() = _UserLogOut;
}
