import 'package:fpdart/fpdart.dart';

import '../../core/error/failure.dart';
import '../models/person.dart';

abstract interface class DogSitterRepository {
  Future<Either<Failure, Unit>> addInformation({required String position});
  Future<Either<Failure, Person>> getPerson();
}
