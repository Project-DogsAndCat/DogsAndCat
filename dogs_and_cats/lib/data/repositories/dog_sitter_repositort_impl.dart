import 'dart:typed_data';

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

  @override
  Future<Either<Failure, Unit>> addImage(
      {required Uint8List imageBytes}) async {
    try {
      final personId = supabaseClient.auth.currentUser!.id;
      await supabaseClient.storage
          .from('photo')
          .uploadBinary('/$personId/photo', imageBytes,
              fileOptions: FileOptions(
                upsert: true,
              ));

      return right(unit);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> getImageUrl() async {
    try {
      final personId = supabaseClient.auth.currentUser!.id;
      String imageUrl =
          supabaseClient.storage.from('photo').getPublicUrl('$personId/photo');

      imageUrl = Uri.parse(imageUrl).replace(queryParameters: {
        't': DateTime.now().millisecondsSinceEpoch.toString()
      }).toString();
      return right(imageUrl);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
