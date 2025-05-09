import 'dart:io';
import 'dart:typed_data';

import 'package:dogs_and_cats/core/error/failure.dart';
import 'package:dogs_and_cats/data/models/dogsitter/dogsitter_dto.dart';
import 'package:dogs_and_cats/domain/models/dogsitter.dart';
import 'package:dogs_and_cats/domain/repositories/dog_sitter_repository.dart';
import 'package:fpdart/src/either.dart';
import 'package:fpdart/src/unit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/utils/app_strings.dart';
import '../../core/utils/table_names.dart';
import '../../domain/models/service.dart';

class DogSitterRepositoryImpl implements DogSitterRepository {
  DogSitterRepositoryImpl({required this.supabaseClient});
  final SupabaseClient supabaseClient;
  // Dogsitter? cache;

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
      // clearCache();
      return right(unit);
    } on SocketException catch (_) {
      return left(Failure(message: AppString.internetNotFound));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Dogsitter>> getDogsitter() async {
    try {
      // if (cache != null) return right(cache!);

      final json = await supabaseClient.rpc('get_dogsitter_services',
          params: {'per_person_id': supabaseClient.auth.currentUser!.id});

      if (json == null) return left(Failure(message: 'Не найден выгульщик'));

      final dogsitter = DogsitterDto.fromJson(json).toDomain();

      // updateCache(dogsitter);
      return right(dogsitter);
    } on SocketException catch (_) {
      return left(Failure(message: AppString.internetNotFound));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateStatus({
    required StatusDogSitter status,
  }) async {
    try {
      final personId = supabaseClient.auth.currentUser!.id;

      await supabaseClient.from(TableNames.dogsitters).update({
        'status': status.value,
      }).eq('person_id', personId);

      return right(unit);
    } on SocketException catch (_) {
      return left(Failure(message: AppString.internetNotFound));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateRating({
    required double rating,
    required String dogsitterId,
  }) async {
    try {
      await supabaseClient
          .from(TableNames.dogsitters)
          .update({'rating': rating}).eq('id', dogsitterId);
      return right(unit);
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

      // clearCache();
      return right(unit);
    } on SocketException catch (_) {
      return left(Failure(message: AppString.internetNotFound));
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

      // clearCache();
      return right(imageUrl);
    } on SocketException catch (_) {
      return left(Failure(message: AppString.internetNotFound));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  // void clearCache() {
  //   cache = null;
  // }
  //
  // void updateCache(Dogsitter dogsitter) {
  //   cache = dogsitter;
  // }
}
