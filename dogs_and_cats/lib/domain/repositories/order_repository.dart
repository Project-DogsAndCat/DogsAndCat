import 'package:dogs_and_cats/domain/models/order.dart';
import 'package:fpdart/fpdart.dart';

import '../../core/error/failure.dart';

abstract interface class OrderRepository {
  Future<Either<Failure, Unit>> addOrder(
      {required OrderModel order, required List<String> petIds});

  Future<List<OrderModel>> getOrders();

  Future<Either<Failure, Unit>> cancelOrder({required OrderModel order});

  Future<List<OrderModel>> getOrderInfoWithFilter(Status status);
}
