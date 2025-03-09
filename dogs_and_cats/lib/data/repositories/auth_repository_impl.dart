import 'package:dogs_and_cats/core/error/failure.dart';
import 'package:fpdart/src/either.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/error/server_exception.dart';
import '../../domain/models/person_auth.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(
      {required this.remoteDataSource, required this.supabaseClient});

  final AuthRemoteDataSource remoteDataSource;
  final SupabaseClient supabaseClient;

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
          email: email, password: password);
      final json = person.toJson();
      await _addPerson(
          jsonPerson: json
            ..addAll({'firstName': firstName, 'lastName': lastName}));

      return right(person.toDomain());
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    }
  }

  Future<void> _addPerson({
    required Map<String, dynamic> jsonPerson,
  }) async {
    try {
      await supabaseClient.from('person').insert(jsonPerson);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
