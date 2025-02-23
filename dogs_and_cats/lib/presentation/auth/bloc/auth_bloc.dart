import 'package:dogs_and_cats/domain/models/person_auth.dart';
import 'package:dogs_and_cats/domain/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _repository;
  AuthBloc(this._repository) : super(AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.map(
          signUp: (event) => _signUp(emit, event.firstName, event.lastName,
              event.email, event.password));
    });
  }

  Future<void> _signUp(Emitter<AuthState> emit, String firstName,
      String lastName, String email, String password) async {
    emit(AuthState.loading());

    final result = await _repository.signUpWithEmailPassword(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password);

    result.fold((failure) => emit(AuthState.failure(message: failure.message)),
        (person) => emit(AuthState.success(person: person)));
  }
}
