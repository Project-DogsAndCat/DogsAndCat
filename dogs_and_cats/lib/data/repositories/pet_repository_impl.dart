import 'package:dogs_and_cats/core/error/failure.dart';
import 'package:dogs_and_cats/core/error/server_exception.dart';
import 'package:dogs_and_cats/core/utils/table_names.dart';
import 'package:dogs_and_cats/data/models/pet/pet_dto.dart';
import 'package:dogs_and_cats/domain/models/pet.dart';
import 'package:fpdart/src/either.dart';
import 'package:fpdart/src/unit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/repositories/pet_repository.dart';

class PetRepositoryImpl implements PetRepository {
  PetRepositoryImpl({required this.supabaseClient});
  final SupabaseClient supabaseClient;

  @override
  Future<Either<Failure, List<Pet>>> getPets({required String id}) async {
    try {
      final json = await supabaseClient
          .from(TableNames.pets)
          .select('')
          .eq('person_id', id);

      final List<Pet> pets =
          json.map((json) => PetDto.fromJson(json).toDomain()).toList();
      return right(pets);
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> addPet({required PetDto dto}) async {
    try {
      final json = dto.toJson();
      json['person_id'] = supabaseClient.auth.currentUser!.id;

      await supabaseClient.from(TableNames.pets).insert(json);

      return right(unit);
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> updatePet({required PetDto dto}) {
    // TODO: implement updatePerson
    throw UnimplementedError();
  }
}
