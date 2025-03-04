import 'package:dogs_and_cats/core/dependency/dependencies.dart';
import 'package:dogs_and_cats/core/error/failure.dart';
import 'package:dogs_and_cats/data/models/person_auth/person_auth.dart';

import 'package:fpdart/src/either.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/error/server_exception.dart';
import '../../domain/models/person_auth/person_auth.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required this.remoteDataSource});

  final AuthRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, PersonAuth>> loginWithEmailPassword(
      {required String email, required String password}) async {
    try {
      final person = await remoteDataSource.loginWithEmailPassword(
          email: email, password: password);

      return right(person.toDomain());
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, PersonAuth>> signUpWithEmailPassword(
      {required String firstName,
      required String lastName,
      required String email,
      required String password}) async {
    try {
      final person = await remoteDataSource.signUpWithEmailPassword(
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password);
      await _addUser(person: person);

      return right(person.toDomain());
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    }
  }

  Future<void> _addUser({
    required PersonAuthModel person,
  }) async {
    try {
      await getIt<SupabaseClient>().from('person').insert(person.toJson());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
