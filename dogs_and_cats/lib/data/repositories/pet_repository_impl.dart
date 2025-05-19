import 'dart:io';

import 'package:dogs_and_cats/core/error/failure.dart';
import 'package:dogs_and_cats/core/error/server_exception.dart';
import 'package:dogs_and_cats/core/utils/table_names.dart';
import 'package:dogs_and_cats/data/models/pet/pet_dto.dart';
import 'package:dogs_and_cats/domain/models/pet.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/utils/app_strings.dart';
import '../../domain/repositories/pet_repository.dart';
import '../models/pet/pet_edit_dto.dart';

class PetRepositoryImpl implements PetRepository {
  PetRepositoryImpl({required this.supabaseClient});
  final SupabaseClient supabaseClient;
  final List<Pet> _cache = [];

  @override
  Future<Either<Failure, List<Pet>>> getPets({required String id}) async {
    try {
      if (_cache.isNotEmpty) return right(_cache);

      final json = await supabaseClient
          .from(TableNames.pets)
          .select('')
          .eq('person_id', id);

      final pets =
          json.map((json) => PetDto.fromJson(json).toDomain()).toList();
      _cache.addAll(pets);
      return right(pets);
    } on SocketException catch (_) {
      return left(Failure(message: AppString.internetNotFound));
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> addPet({required PetDto dto}) async {
    try {
      _cache.clear();
      dto.personId = supabaseClient.auth.currentUser!.id;
      final json = dto.toJson();
      json.remove('id');
      await supabaseClient.from(TableNames.pets).insert(json);

      return right(unit);
    } on SocketException catch (_) {
      return left(Failure(message: AppString.internetNotFound));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> updatePet({required PetEditDto pet}) async {
    try {
      _cache.clear();
      final id = pet.id;
      final updateJson = pet.toJson();
      updateJson.remove('id');
      await supabaseClient
          .from(TableNames.pets)
          .update(updateJson)
          .eq('id', id);
      return right(unit);
    } on SocketException catch (_) {
      return left(Failure(message: AppString.internetNotFound));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
