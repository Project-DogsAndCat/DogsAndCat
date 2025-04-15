import 'package:dogs_and_cats/core/error/failure.dart';
import 'package:dogs_and_cats/domain/models/service.dart';
import 'package:dogs_and_cats/domain/models/service_characteristics.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class ServiceRepository {
  Future<List<Service>> getServices();

  Future<Either<Failure, Service>> getServiceById({required String serviceId});

  Future<Either<Failure, List<ServiceCharacteristic>>>
      getCharacteristicsService({required String id});
}
