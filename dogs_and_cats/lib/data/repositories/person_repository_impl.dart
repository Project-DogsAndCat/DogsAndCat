import 'package:dogs_and_cats/core/error/failure.dart';
import 'package:dogs_and_cats/data/models/person/person_dto.dart';
import 'package:dogs_and_cats/domain/models/person.dart';
import 'package:dogs_and_cats/domain/repositories/person_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/utils/table_names.dart';

class PersonRepositoryImpl implements PersonRepository {
  PersonRepositoryImpl({required this.supabaseClient});
  final SupabaseClient supabaseClient;

  @override
  Future<Either<Failure, Person>> getPerson() async {
    try {
      final personId = supabaseClient.auth.currentUser!.id;
      final jsonList = await supabaseClient
          .from(TableNames.person)
          .select()
          .eq('id', personId);
      final person = PersonDto.fromJson(jsonList.first);
      return right(person.toDomain());
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> updatePerson({
    required Person originalPerson,
    required Person updatePerson,
  }) async {
    try {
      final personId = originalPerson.id!;
      final json = getChangesData(originalPerson, updatePerson);

      await supabaseClient
          .from(TableNames.person)
          .update(json)
          .eq('id', personId);
      return right(unit);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  Map<String, dynamic> getChangesData(
      Person originalPerson, Person updatePerson) {
    final originalJson = PersonDto.fromDomain(originalPerson).toJson();
    final updatedJson = PersonDto.fromDomain(updatePerson).toJson();
    final Map<String, dynamic> changes = {};

    updatedJson.forEach((key, value) {
      if (key == 'id') return;
      if (originalJson[key] != value) {
        changes[key] = value;
      }
    });
    return changes;
  }

  @override
  Future<Either<Failure, Unit>> updateEmail({required String email}) async {
    try {
      final result = await supabaseClient.auth.updateUser(
        UserAttributes(
          email: email,
        ),
      );
      if (result.user == null) {
        return left(Failure(message: 'Не удалось изменить E-mail'));
      }
      return right(unit);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
