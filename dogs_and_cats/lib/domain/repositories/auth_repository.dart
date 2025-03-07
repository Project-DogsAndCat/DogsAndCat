import 'package:fpdart/fpdart.dart';

import '../../core/error/failure.dart';
import '../models/person_auth.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, PersonAuth>> signUpWithEmailPassword(
      {required String firstName,
      required String lastName,
      required String email,
      required String password});

  Future<Either<Failure, PersonAuth>> loginWithEmailPassword(
      {required String email, required String password});
}
