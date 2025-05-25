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
  final Map<String, List<ServiceCharacteristic>> _cache = {};
  final List<Service> _cacheServices = [];

  @override
  Future<List<Service>> getServices() async {
    if (_cacheServices.isNotEmpty) return _cacheServices;

    final json = await supabaseClient.from(TableNames.services).select('');
    final services =
        json.map((element) => ServiceDto.fromJson(element).toDomain()).toList();

    _cacheServices.addAll(services);
    return _cacheServices;
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
      if (_cache[id] != null && _cache[id]!.isNotEmpty) {
        return right(_cache[id]!);
      }

      final json = await supabaseClient
          .from('service_characteristics')
          .select()
          .eq('service_id', id);

      final servicesCharacteristics = json
          .map((element) =>
              ServiceCharacteristicDto.fromJson(element).toDomain())
          .toList();

      _cache[id] = servicesCharacteristics;
      return right(servicesCharacteristics);
    } on SocketException catch (_) {
      return left(Failure(message: AppString.internetNotFound));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
