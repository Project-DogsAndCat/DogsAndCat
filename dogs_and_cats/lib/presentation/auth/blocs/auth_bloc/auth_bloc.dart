import 'package:bloc/bloc.dart';
import 'package:dogs_and_cats/domain/repositories/auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepository repository;
  AuthBloc({required this.repository})
      : super(const AuthState.notAuthorized()) {
    on<AuthEvent>((event, emit) async {
      await event.map(
          userLogin: (_) => _userLogin(emit),
          userLogOut: (_) => _userLogOut(emit));
    });
  }

  Future<void> _userLogin(Emitter<AuthState> emit) async {
    emit(AuthState.authorized());
  }

  Future<void> _userLogOut(Emitter<AuthState> emit) async {
    final result = await repository.signOut();
    result.fold((failure) => emit(AuthState.failure(message: failure.message)),
        (_) => emit(AuthState.notAuthorized()));
  }
}
