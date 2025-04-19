import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';

import '../../core/error/failure.dart';
import '../models/person.dart';

abstract interface class DogSitterRepository {
  Future<Either<Failure, Unit>> addInformation({
    required String position,
  });

  Future<Either<Failure, Person>> getPerson();

  Future<Either<Failure, Unit>> addImage({
    required Uint8List imageBytes,
  });

  Future<Either<Failure, String>> getImageUrl();
}
