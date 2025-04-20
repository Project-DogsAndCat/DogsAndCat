import 'dart:typed_data';

import 'package:dogs_and_cats/domain/models/service.dart';
import 'package:fpdart/fpdart.dart';

import '../../core/error/failure.dart';
import '../models/person.dart';

abstract interface class DogSitterRepository {
  Future<Either<Failure, Unit>> addInformation({
    required Set<Service> selectedServices,
  });

  Future<Either<Failure, Person>> getPerson();

  Future<Either<Failure, Unit>> addImage({
    required Uint8List imageBytes,
  });

  Future<Either<Failure, String>> getImageUrl();
}
