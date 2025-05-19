import 'package:dogs_and_cats/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class BecomeDogsitterRepository {
  Future<Either<Failure, Unit>> becomeDogsitter();

  Future<Either<Failure, Unit>> addedInfoFlag();
}
