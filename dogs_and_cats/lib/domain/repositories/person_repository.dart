import 'package:dogs_and_cats/core/error/failure.dart';
import 'package:dogs_and_cats/domain/models/person/person.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class PersonRepository {
  Future<Either<Failure, Person>> addExtraPersonInfo({
    required String id,
    required String phone,
    required String latitude,
    required String longitude,
  });
}
