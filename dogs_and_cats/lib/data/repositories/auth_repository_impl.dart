import 'package:dogs_and_cats/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/error/server_exception.dart';
import '../../core/utils/table_names.dart';
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

      final json = {'first_name': firstName, 'last_name': lastName};
      _addPerson(id: person.id, json: json);

      return right(person.toDomain());
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    }
  }

  Future<void> _addPerson(
      {required String id, required Map<String, dynamic> json}) async {
    try {
      await supabaseClient.from(TableNames.person).update(json).eq('id', id);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<Either<Failure, Unit>> signOut() async {
    try {
      await remoteDataSource.signOut();
      return right(unit);
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    }
  }
}
