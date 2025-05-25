import 'package:dogs_and_cats/core/error/failure.dart';
import 'package:dogs_and_cats/domain/models/person.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class PersonRepository {
  Future<Either<Failure, Person>> getPerson();

  Future<Either<Failure, Unit>> updatePerson({
    required Person originalPerson,
    required Person updatePerson,
  });

  Future<Either<Failure, Unit>> updateEmail({
    required String email,
  });
}
