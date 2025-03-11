import 'package:dogs_and_cats/data/models/person_auth/person_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/error/server_exception.dart';

abstract interface class AuthRemoteDataSource {
  Future<PersonAuthModel> signUpWithEmailPassword(
      {required String email, required String password});

  Future<PersonAuthModel> loginWithEmailPassword(
      {required String email, required String password});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({required this.supabaseClient});
  final SupabaseClient supabaseClient;

  @override
  Future<PersonAuthModel> loginWithEmailPassword(
      {required String email, required String password}) async {
    try {
      final response = await supabaseClient.auth
          .signInWithPassword(email: email, password: password);
      if (response.user == null) {
        throw ServerException('Пользователь не найден');
      }

      final json = response.session!.user.toJson();

      return PersonAuthModel.fromJson(json);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<PersonAuthModel> signUpWithEmailPassword(
      {required String email, required String password}) async {
    try {
      final response =
          await supabaseClient.auth.signUp(password: password, email: email);
      if (response.user == null) {
        throw ServerException('Пользователь не найден');
      }

      final json = response.user!.toJson();

      return PersonAuthModel.fromJson(json);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
