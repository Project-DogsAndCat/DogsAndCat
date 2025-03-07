import 'package:dogs_and_cats/core/error/failure.dart';
import 'package:dogs_and_cats/data/models/person/person_model.dart';
import 'package:dogs_and_cats/domain/models/person.dart';
import 'package:dogs_and_cats/domain/repositories/person_repository.dart';
import 'package:fpdart/src/either.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/dependency/dependencies.dart';

class PersonRepositoryImpl implements PersonRepository {
  @override
  Future<Either<Failure, Person>> addExtraPersonInfo(
      {required String id,
      required String phone,
      required String latitude,
      required String longitude}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Person>> getPerson({required String id}) async {
    try {
      final jsonList =
          await getIt<SupabaseClient>().from('person').select().eq('id', id);
      final person = PersonModel.fromJson(jsonList.first);
      return right(person.toDomain());
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
