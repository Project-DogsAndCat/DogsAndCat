import 'package:dogs_and_cats/domain/models/order.dart';
import 'package:dogs_and_cats/domain/models/task.dart';
import 'package:fpdart/fpdart.dart';

import '../../core/error/failure.dart';

abstract interface class OrderRepository {
  Future<Either<Failure, Unit>> addOrder({
    required OrderModel order,
    required List<String> petIds,
  });

  Future<Either<Failure, List<TaskModel>>> getOrders();

  Future<Either<Failure, Unit>> cancel({
    required String orderId,
  });

  Future<List<TaskModel>> getOrderInfoWithFilter(Status status);
}
