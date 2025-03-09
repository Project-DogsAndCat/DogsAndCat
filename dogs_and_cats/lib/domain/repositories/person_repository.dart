import 'package:dogs_and_cats/core/error/failure.dart';
import 'package:dogs_and_cats/domain/models/person.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/models/person/person_dto.dart';

abstract interface class PersonRepository {
  Future<Either<Failure, Person>> getPerson({required String id});

  Future<Either<Failure, Unit>> updatePerson(
      {required String id, required PersonDto dto});
}
