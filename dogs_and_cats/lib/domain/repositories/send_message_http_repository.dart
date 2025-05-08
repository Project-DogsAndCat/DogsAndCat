import 'package:fpdart/fpdart.dart';

import '../../core/error/failure.dart';

abstract interface class SendMessageHttpRepository {
  Future<Either<Failure, Unit>> sendMessage({
    required String userFcmToken,
    required String dogsitter,
  });
}
