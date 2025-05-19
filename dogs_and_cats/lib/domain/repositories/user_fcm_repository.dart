import 'package:fpdart/fpdart.dart';

import '../../core/error/failure.dart';

abstract interface class UserFcmRepository {
  Future<Either<Failure, Unit>> upsertFcmToken({required String token});
}
