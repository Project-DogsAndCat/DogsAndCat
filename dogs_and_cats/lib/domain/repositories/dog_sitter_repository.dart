import 'dart:typed_data';

import 'package:dogs_and_cats/domain/models/dogsitter.dart';
import 'package:dogs_and_cats/domain/models/service.dart';
import 'package:fpdart/fpdart.dart';

import '../../core/error/failure.dart';

abstract interface class DogSitterRepository {
  Future<Either<Failure, Unit>> addInformation({
    required Set<Service> selectedServices,
  });

  Future<Either<Failure, Dogsitter>> getDogsitter();

  Future<Either<Failure, Unit>> updateStatus({
    required StatusDogSitter status,
  });

  Future<Either<Failure, Unit>> updateRating({
    required double rating,
    required String dogsitterId,
  });

  Future<Either<Failure, Unit>> addImage({
    required Uint8List imageBytes,
  });

  Future<Either<Failure, String>> getImageUrl();

  Future<Either<Failure, String>> getImageUrlById({
    required String id,
  });
}
