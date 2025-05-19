import 'package:dogs_and_cats/core/error/failure.dart';
import 'package:dogs_and_cats/domain/repositories/become_dogsitter_repository.dart';
import 'package:fpdart/src/either.dart';
import 'package:fpdart/src/unit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BecomeDogsitterRepositoryImpl implements BecomeDogsitterRepository {
  BecomeDogsitterRepositoryImpl({required this.supabaseClient});
  final SupabaseClient supabaseClient;

  @override
  Future<Either<Failure, Unit>> becomeDogsitter() async {
    try {
      final person = supabaseClient.auth.currentUser;
      if (person == null) {
        return left(Failure(message: 'Пользователь не найден'));
      }

      UserAttributes attributes =
          UserAttributes(data: {'role_user': 'dogsitter'});
      await supabaseClient.auth.updateUser(attributes);

      return right(unit);
    } on AuthApiException catch (e) {
      final error = authException(e);
      return left(error);
    } on AuthRetryableFetchException catch (_) {
      return left(Failure(message: 'Проблемы с сетью'));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> addedInfoFlag() async {
    try {
      final person = supabaseClient.auth.currentUser;
      if (person == null) {
        return left(Failure(message: 'Пользователь не найден'));
      }

      UserAttributes attributes = UserAttributes(data: {'is_added_info': true});
      await supabaseClient.auth.updateUser(attributes);

      return right(unit);
    } on AuthApiException catch (e) {
      final error = authException(e);
      return left(error);
    } on AuthRetryableFetchException catch (_) {
      return left(Failure(message: 'Проблемы с сетью'));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
