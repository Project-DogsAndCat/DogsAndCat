import 'dart:typed_data';

import 'package:dogs_and_cats/core/error/failure.dart';
import 'package:dogs_and_cats/data/models/dogsitter/dogsitter_dto.dart';
import 'package:dogs_and_cats/domain/models/dogsitter.dart';
import 'package:dogs_and_cats/domain/repositories/dog_sitter_repository.dart';
import 'package:fpdart/src/either.dart';
import 'package:fpdart/src/unit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/utils/table_names.dart';
import '../../domain/models/service.dart';

class DogSitterRepositoryImpl implements DogSitterRepository {
  DogSitterRepositoryImpl({required this.supabaseClient});
  final SupabaseClient supabaseClient;
  @override
  Future<Either<Failure, Unit>> addInformation(
      {required Set<Service> selectedServices}) async {
    try {
      final personId = supabaseClient.auth.currentUser!.id;

      final dogSitter = await supabaseClient
          .from(TableNames.dogsitters)
          .insert({
            'person_id': personId,
            'status': StatusDogSitter.free,
          })
          .select()
          .single();

      final dogSitterId = dogSitter['id'];

      await supabaseClient
          .from(TableNames.participation)
          .insert(selectedServices
              .map((service) => {
                    'dogsitter_id': dogSitterId,
                    'service_id': service.id,
                  })
              .toList());

      return right(unit);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  // @override
  // Future<Either<Failure, Dogsitter>> getDogsitter() async {
  //   try {
  //     final personId = supabaseClient.auth.currentUser!.id;
  //
  //     final response = await supabaseClient.from('dogsitters').select('''
  //   *,
  //   person:person_id(*),
  //   service_ids:participation(service_id)
  // ''').eq('person_id', personId);
  //
  //     final dogsitter = DogsitterDto.fromJson(response[0]).toDomain();
  //
  //     return right(dogsitter);
  //   } catch (e) {
  //     return left(Failure(message: e.toString()));
  //   }
  // }

  @override
  Future<Either<Failure, Dogsitter>> getDogsitter() async {
    try {
      final json = await supabaseClient.rpc('get_dogsitter_services',
          params: {'per_person_id': supabaseClient.auth.currentUser!.id});
      final dogsitter = DogsitterDto.fromJson(json).toDomain();
      return right(dogsitter);
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
