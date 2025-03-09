import 'package:dogs_and_cats/core/error/failure.dart';
import 'package:dogs_and_cats/data/models/person/person_dto.dart';
import 'package:dogs_and_cats/domain/models/person.dart';
import 'package:dogs_and_cats/domain/repositories/person_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PersonRepositoryImpl implements PersonRepository {
  PersonRepositoryImpl({required this.supabaseClient});
  final SupabaseClient supabaseClient;

  @override
  Future<Either<Failure, Person>> getPerson({required String id}) async {
    try {
      final jsonList =
          await supabaseClient.from('person').select().eq('id', id);
      final person = PersonDto.fromJson(jsonList.first);
      return right(person.toDomain());
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> updatePerson(
      {required String id, required PersonDto dto}) async {
    try {
      final updates = {
        if (dto.firstName != null) 'firstName': dto.firstName,
        if (dto.lastName != null) 'lastName': dto.lastName,
        if (dto.isValidatingPhone()) 'phone': dto.phone,
      };
      await _updateAutUser(dto, updates);

      await supabaseClient.from('person').update(updates).eq('id', id);
      return right(unit);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  Future<void> _updateAutUser(
      PersonDto dto, Map<String, String?> updates) async {
    late UserResponse res;
    if (dto.isValidatingEmail()) {
      res = await supabaseClient.auth.updateUser(
        UserAttributes(
          email: dto.email,
        ),
      );
      if (res.user == null) {
        left(Failure(message: 'Не удалось изменить E-mail'));
      }
      updates['email'] = dto.email;
    }
  }
}
