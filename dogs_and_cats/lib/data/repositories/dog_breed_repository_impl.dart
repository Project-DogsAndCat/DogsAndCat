import 'dart:convert';

import 'package:dogs_and_cats/core/error/failure.dart';
import 'package:dogs_and_cats/data/models/dog_breed/dog_breed_dto.dart';
import 'package:dogs_and_cats/domain/models/dog_breed.dart';
import 'package:dogs_and_cats/domain/repositories/dog_breed_repository.dart';
import 'package:flutter/services.dart';
import 'package:fpdart/src/either.dart';

class DogBreedRepositoryImpl implements DogBreedRepository {
  final List<DogBreed> cache = [];

  @override
  Future<Either<Failure, List<DogBreed>>> getDogBreed() async {
    try {
      final jsonStr = await rootBundle.loadString('assets/data/breeds.json');
      final List<dynamic> json = jsonDecode(jsonStr);
      final dogBreeds =
          json.map((json) => DogBreedDto.fromJson(json).toDomain()).toList();

      cache.addAll(dogBreeds);
      return right(dogBreeds);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Either<Failure, List<DogBreed>> getSearchDogBreed({required String query}) {
    try {
      final List<DogBreed> filter = cache
          .where((breed) =>
              breed.name.toLowerCase().startsWith(query.trim().toLowerCase()) ||
              breed.name.toLowerCase().contains(query.trim().toLowerCase()))
          .toList();
      return right(filter);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
