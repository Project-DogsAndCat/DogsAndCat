import 'package:dogs_and_cats/data/models/person_auth/person_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/error/server_exception.dart';

abstract interface class AuthRemoteDataSource {
  Future<PersonAuthModel> signUpWithEmailPassword(
      {required String firstName,
      required String lastName,
      required String email,
      required String password});
  Future<PersonAuthModel> loginWithEmailPassword(
      {required String email, required String password});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({required this.supabaseClient});
  final SupabaseClient supabaseClient;

  @override
  Future<PersonAuthModel> loginWithEmailPassword(
      {required String email, required String password}) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<PersonAuthModel> signUpWithEmailPassword(
      {required String firstName,
      required String lastName,
      required String email,
      required String password}) async {
    try {
      final response = await supabaseClient.auth.signUp(
          password: password,
          email: email,
          data: {'firstName': firstName, 'lastName': lastName});
      if (response.user == null) {
        throw ServerException('Пользователь не найден');
      }

      final metadata = response.user!.userMetadata;
      final useJson = {
        'firstName': metadata!['firstName'] as String,
        'lastName': metadata['lastName'] as String,
        'email': response.user!.email,
        'password': ''
      };

      return PersonAuthModel.fromJson(useJson);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
