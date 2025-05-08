import 'package:dogs_and_cats/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/utils/table_names.dart';
import '../../domain/models/person_auth.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/person_auth/person_auth_dto.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required this.supabaseClient});

  final SupabaseClient supabaseClient;

  @override
  Future<Either<Failure, PersonAuth>> loginWithEmailPassword(
      {required String email, required String password}) async {
    try {
      final response = await supabaseClient.auth
          .signInWithPassword(email: email, password: password);
      if (response.user == null) {
        return left(Failure(message: 'Пользователь не найден'));
      }

      final json = response.session!.user.toJson();
      json['role_user'] = response.session!.user.userMetadata?['role_user'];

      return right(PersonAuthDto.fromJson(json).toDomain());
    } on AuthApiException catch (e) {
      final error = authException(e);
      return left(error);
    } on AuthRetryableFetchException catch (_) {
      return left(Failure(message: 'Проблемы с сетью'));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, PersonAuth>> signUpWithEmailPassword(
      {required String firstName,
      required String lastName,
      required String email,
      required String password}) async {
    try {
      final permissions = {'role_user': 'user'};
      final response = await supabaseClient.auth
          .signUp(password: password, email: email, data: permissions);

      if (response.user == null) {
        return left(Failure(message: 'Пользователь не найден'));
      }

      final json = response.user!.toJson();
      json['role_user'] = response.session!.user.userMetadata?['role_user'];

      final addName = {'first_name': firstName, 'last_name': lastName};
      await _addPerson(id: response.user!.id, json: addName);

      return right(PersonAuthDto.fromJson(json).toDomain());
    } on AuthApiException catch (e) {
      final error = authException(e);
      return left(error);
    } on AuthRetryableFetchException catch (_) {
      return left(Failure(message: 'Проблемы с сетью'));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  Future<void> _addPerson(
      {required String id, required Map<String, dynamic> json}) async {
    try {
      await supabaseClient.from(TableNames.person).update(json).eq('id', id);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Either<Failure, Unit>> signOut() async {
    try {
      // await remoteDataSource.signOut();
      return right(unit);
    } on AuthRetryableFetchException catch (_) {
      return left(Failure(message: 'Проблемы с сетью'));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
