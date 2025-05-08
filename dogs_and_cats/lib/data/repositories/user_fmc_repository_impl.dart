import 'dart:io';

import 'package:dogs_and_cats/core/error/failure.dart';
import 'package:dogs_and_cats/domain/repositories/user_fcm_repository.dart';
import 'package:fpdart/src/either.dart';
import 'package:fpdart/src/unit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/utils/app_strings.dart';
import '../../core/utils/table_names.dart';

class UserFmcRepositoryImpl implements UserFmcRepository {
  UserFmcRepositoryImpl({required this.supabaseClient});
  final SupabaseClient supabaseClient;

  @override
  Future<Either<Failure, Unit>> upsertFmcToken({required String token}) async {
    try {
      final person = supabaseClient.auth.currentUser;

      if (person == null) {
        return left(Failure(message: 'Пользователь не найден'));
      }

      await supabaseClient
          .from(TableNames.userFcmTokens)
          .upsert({'person_id': person.id, 'token': token});

      return right(unit);
    } on SocketException catch (_) {
      return left(Failure(message: AppString.internetNotFound));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
