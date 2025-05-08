import 'package:bloc/bloc.dart';
import 'package:dogs_and_cats/domain/repositories/auth_repository.dart';
import 'package:dogs_and_cats/domain/repositories/user_fcm_repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepository authRepository;
  UserFmcRepository fmcRepository;
  AuthBloc({
    required this.authRepository,
    required this.fmcRepository,
  }) : super(const AuthState.notAuthorized()) {
    on<AuthEvent>((event, emit) async {
      await event.map(
          userLogin: (_) => _userLogin(emit),
          userLogOut: (_) => _userLogOut(emit));
    });
  }

  Future<void> _userLogin(Emitter<AuthState> emit) async {
    final messaging = FirebaseMessaging.instance;
    final token = await messaging.getToken();
    if (token != null) {
      final result = await fmcRepository.upsertFmcToken(token: token);
      result.fold(
          (failure) => emit(AuthState.failure(
              message: 'Что-то пошло не так. Попробуйте позже')),
          (_) => emit(AuthState.authorized()));
    } else {
      emit(AuthState.failure(message: 'Что-то пошло не так. Попробуйте позже'));
    }
  }

  Future<void> _userLogOut(Emitter<AuthState> emit) async {
    final result = await authRepository.signOut();
    result.fold((failure) => emit(AuthState.failure(message: failure.message)),
        (_) => emit(AuthState.notAuthorized()));
  }
}
