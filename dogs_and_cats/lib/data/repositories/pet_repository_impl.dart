import 'package:dogs_and_cats/core/error/failure.dart';
import 'package:dogs_and_cats/core/error/server_exception.dart';
import 'package:dogs_and_cats/core/utils/table_names.dart';
import 'package:dogs_and_cats/data/models/pet/pet_dto.dart';
import 'package:dogs_and_cats/domain/models/pet.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/repositories/pet_repository.dart';
import '../models/pet/pet_edit_dto.dart';

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
      dto.personId = supabaseClient.auth.currentUser!.id;
      final json = dto.toJson();
      json.remove('id');
      await supabaseClient.from(TableNames.pets).insert(json);

      return right(unit);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> updatePet({required PetEditDto pet}) async {
    try {
      final id = pet.id;
      final updates = {
        if (pet.features!.isNotEmpty) 'features': pet.features,
        if (pet.otherFeatures!.isNotEmpty) 'other_features': pet.otherFeatures,
      };
      await supabaseClient.from(TableNames.pets).update(updates).eq('id', id);
      return right(unit);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
