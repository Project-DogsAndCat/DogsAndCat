import 'package:dogs_and_cats/domain/models/dogsitter.dart';
import 'package:fpdart/fpdart.dart';

import '../../core/error/failure.dart';
import '../models/order.dart';

abstract interface class SendMessageHttpRepository {
  Future<Either<Failure, Unit>> sendMessage({
    required String userFcmToken,
    required Dogsitter dogsitter,
    required String serviceTitle,
    required OrderModel order,
  });
}
