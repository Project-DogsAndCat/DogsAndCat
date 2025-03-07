import 'package:dogs_and_cats/core/error/failure.dart';
import 'package:dogs_and_cats/domain/models/person.dart';
import 'package:dogs_and_cats/domain/repositories/person_repository.dart';
import 'package:fpdart/src/either.dart';

class PersonRepositoryImpl implements PersonRepository {
  @override
  Future<Either<Failure, Person>> addExtraPersonInfo(
      {required String id,
      required String phone,
      required String latitude,
      required String longitude}) {
    throw UnimplementedError();
  }
}
