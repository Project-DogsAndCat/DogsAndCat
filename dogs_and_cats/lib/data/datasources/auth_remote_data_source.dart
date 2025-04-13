import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/error/server_exception.dart';
import '../models/person_auth/person_auth_dto.dart';

abstract interface class AuthRemoteDataSource {
  Future<PersonAuthDto> signUpWithEmailPassword(
      {required String email, required String password});

  Future<PersonAuthDto> loginWithEmailPassword(
      {required String email, required String password});
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
        throw ServerException('Пользователь не найден');
      }

      final json = response.session!.user.toJson();
      json['roleUser'] = response.session!.user.userMetadata?['role'];

      return PersonAuthDto.fromJson(json);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<PersonAuthDto> signUpWithEmailPassword(
      {required String email, required String password}) async {
    try {
      final permissions = {'role': 'dogsitter'};

      final response = await supabaseClient.auth
          .signUp(password: password, email: email, data: permissions);
      if (response.user == null) {
        throw ServerException('Пользователь не найден');
      }

      final json = response.user!.toJson();
      json['roleUser'] = response.session!.user.userMetadata?['role'];

      return PersonAuthDto.fromJson(json);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
