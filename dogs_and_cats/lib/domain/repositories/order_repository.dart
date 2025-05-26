import 'package:dogs_and_cats/domain/models/order.dart';
import 'package:dogs_and_cats/domain/models/task.dart';
import 'package:fpdart/fpdart.dart';

import '../../core/error/failure.dart';
import '../../data/models/score/score_dto.dart';

abstract interface class OrderRepository {
  Future<Either<Failure, Unit>> addOrder({
    required OrderModel order,
    required List<String> petIds,
  });

  Stream<Either<Failure, List<TaskModel>>> watchOrders();

  Future<Either<Failure, Unit>> cancel({
    required String orderId,
  });

  Future<Either<Failure, Unit>> addScore({
    required ScoreDto score,
  });
}
