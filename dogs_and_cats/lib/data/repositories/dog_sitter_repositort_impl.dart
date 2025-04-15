import 'package:dogs_and_cats/core/error/failure.dart';
import 'package:dogs_and_cats/domain/models/person.dart';
import 'package:dogs_and_cats/domain/repositories/dog_sitter_repository.dart';
import 'package:fpdart/src/either.dart';
import 'package:fpdart/src/unit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/utils/table_names.dart';
import '../models/person/person_dto.dart';

class DogSitterRepositoryImpl implements DogSitterRepository {
  DogSitterRepositoryImpl({required this.supabaseClient});
  final SupabaseClient supabaseClient;
  @override
  Future<Either<Failure, Unit>> addInformation(
      {required String position}) async {
    try {
      final personId = supabaseClient.auth.currentUser!.id;

      await supabaseClient
          .from(TableNames.dogsitters)
          .insert({'person_id': personId, 'position': position});
      return right(unit);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Person>> getPerson() async {
    try {
      final personId = supabaseClient.auth.currentUser!.id;

      final jsonList = await supabaseClient
          .from(TableNames.person)
          .select('''*,${TableNames.dogsitters}(*)
          ''').eq('id', personId);

      final person = PersonDto.fromJson(jsonList.first);
      return right(person.toDomain());
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
