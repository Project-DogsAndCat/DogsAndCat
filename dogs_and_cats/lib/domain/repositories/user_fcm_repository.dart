import 'package:fpdart/fpdart.dart';

import '../../core/error/failure.dart';

abstract interface class UserFmcRepository {
  Future<Either<Failure, Unit>> upsertFmcToken({required String token});
}
