import 'package:dogs_and_cats/data/models/pet/pet_dto.dart';
import 'package:dogs_and_cats/domain/models/pet.dart';
import 'package:fpdart/fpdart.dart';

import '../../core/error/failure.dart';
import '../../data/models/pet/pet_edit_dto.dart';

abstract interface class PetRepository {
  Future<Either<Failure, List<Pet>>> getPets({required String id});

  Future<Either<Failure, Unit>> addPet({required PetDto dto});

  Future<Either<Failure, Unit>> updatePet({required PetEditDto pet});
}
