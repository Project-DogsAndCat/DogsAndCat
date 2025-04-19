import 'package:dogs_and_cats/domain/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/person_auth.dart';

part 'login_bloc.freezed.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _repository;
  LoginBloc(this._repository) : super(LoginState.initial()) {
    on<LoginEvent>((event, emit) async {
      await event.map(
        signUp: (event) => _signUp(
            emit, event.firstName, event.lastName, event.email, event.password),
        signIn: (event) => _signIn(emit, event.email, event.password),
      );
    });
  }

  Future<void> _signUp(Emitter<LoginState> emit, String firstName,
      String lastName, String email, String password) async {
    emit(LoginState.loading());

    final result = await _repository.signUpWithEmailPassword(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password);

    result.fold((failure) => emit(LoginState.failure(message: failure.message)),
        (person) => emit(LoginState.success(person: person)));
  }

  Future<void> _signIn(
      Emitter<LoginState> emit, String email, String password) async {
    emit(LoginState.loading());

    final result = await _repository.loginWithEmailPassword(
        email: email, password: password);

    result.fold((failure) => emit(LoginState.failure(message: failure.message)),
        (person) => emit(LoginState.success(person: person)));
  }
}
