import 'package:dogs_and_cats/core/error/failure.dart';
import 'package:dogs_and_cats/data/models/order/order_dto.dart';
import 'package:dogs_and_cats/domain/models/service.dart';
import 'package:dogs_and_cats/domain/models/service_characteristics.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class ServiceRepository {
  Future<Either<Failure, List<Service>>> getServices();

  Future<Either<Failure, List<ServiceCharacteristic>>>
      getCharacteristicsService({required String id});

  Future<Either<Failure, Unit>> addOrder(
      {required OrderDto dto, required List<String> petIds});
}
