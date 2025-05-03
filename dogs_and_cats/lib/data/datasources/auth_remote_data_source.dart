import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/person_auth/person_auth_dto.dart';

abstract interface class AuthRemoteDataSource {
  Future<PersonAuthDto> signUpWithEmailPassword(
      {required String email, required String password});

  Future<PersonAuthDto> loginWithEmailPassword(
      {required String email, required String password});

  Future<void> signOut();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({required this.supabaseClient});
  final SupabaseClient supabaseClient;

  @override
  Future<PersonAuthDto> loginWithEmailPassword(
      {required String email, required String password}) async {
    try {
      final response = await supabaseClient.auth
          .signInWithPassword(email: email, password: password);
      if (response.user == null) {
        throw Exception('Пользователь не найден.');
      }

      final json = response.session!.user.toJson();
      json['role_user'] = response.session!.user.userMetadata?['role_user'];

      return PersonAuthDto.fromJson(json);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<PersonAuthDto> signUpWithEmailPassword(
      {required String email, required String password}) async {
    try {
      final permissions = {'role_user': 'user'};

      final response = await supabaseClient.auth
          .signUp(password: password, email: email, data: permissions);

      if (response.user == null) {
        throw Exception('Пользователь не найден.');
      }

      final json = response.user!.toJson();
      json['role_user'] = response.session!.user.userMetadata?['role_user'];

      return PersonAuthDto.fromJson(json);
    } on AuthApiException catch (e) {
      throw AuthApiException(e.statusCode.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> signOut() async {
    try {
      if (supabaseClient.auth.currentUser == null) {
        throw Exception('Пользователь не найден.');
      }
      await supabaseClient.auth.signOut();
    } on AuthApiException catch (e) {
      throw AuthApiException(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
