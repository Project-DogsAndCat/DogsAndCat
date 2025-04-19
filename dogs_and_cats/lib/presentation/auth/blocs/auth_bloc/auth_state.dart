part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.authorized() = _Authorized;
  const factory AuthState.notAuthorized() = _NotAuthorized;
  const factory AuthState.failure({required String message}) = _Failure;
}
