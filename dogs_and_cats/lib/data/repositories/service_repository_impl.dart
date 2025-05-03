import 'dart:io';

import 'package:dogs_and_cats/core/error/failure.dart';
import 'package:dogs_and_cats/data/models/service/service_dto.dart';
import 'package:dogs_and_cats/data/models/service_characteristic/service_characteristic_dto.dart';
import 'package:dogs_and_cats/domain/models/service.dart';
import 'package:dogs_and_cats/domain/models/service_characteristics.dart';
import 'package:dogs_and_cats/domain/repositories/service_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/utils/app_strings.dart';
import '../../core/utils/table_names.dart';

class ServiceRepositoryImpl implements ServiceRepository {
  ServiceRepositoryImpl({required this.supabaseClient});
  final SupabaseClient supabaseClient;

  @override
  Future<List<Service>> getServices() async {
    final json = await supabaseClient.from(TableNames.services).select('');
    List<Service> services =
        json.map((element) => ServiceDto.fromJson(element).toDomain()).toList();
    return services;
  }

  @override
  Future<Either<Failure, Service>> getServiceById(
      {required String serviceId}) async {
    try {
      final json = await supabaseClient
          .from(TableNames.services)
          .select()
          .eq('id', serviceId)
          .single();
      final service = ServiceDto.fromJson(json).toDomain();
      return right(service);
    } on SocketException catch (_) {
      return left(Failure(message: AppString.internetNotFound));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ServiceCharacteristic>>>
      getCharacteristicsService({required String id}) async {
    try {
      final json = await supabaseClient
          .from('service_characteristics')
          .select()
          .eq('service_id', id);
      List<ServiceCharacteristic> cache = json
          .map((element) =>
              ServiceCharacteristicDto.fromJson(element).toDomain())
          .toList();
      return right(cache);
    } on SocketException catch (_) {
      return left(Failure(message: AppString.internetNotFound));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
