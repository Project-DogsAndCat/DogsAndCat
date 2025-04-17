import 'package:dogs_and_cats/domain/models/dog_breed.dart';
import 'package:fpdart/fpdart.dart';

import '../../core/error/failure.dart';

abstract interface class DogBreedRepository {
  Future<Either<Failure, List<DogBreed>>> getDogBreed();

  Either<Failure, List<DogBreed>> getSearchDogBreed({
    required String query,
  });
}
