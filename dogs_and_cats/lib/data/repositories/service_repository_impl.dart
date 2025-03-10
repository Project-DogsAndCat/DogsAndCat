import 'package:dogs_and_cats/core/dependency/dependencies.dart';
import 'package:dogs_and_cats/core/error/failure.dart';
import 'package:dogs_and_cats/data/models/service/service_model.dart';
import 'package:dogs_and_cats/domain/models/service.dart';
import 'package:dogs_and_cats/domain/repositories/service_repository.dart';
import 'package:fpdart/src/either.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ServiceRepositoryImpl implements ServiceRepository {
  ServiceRepositoryImpl({required this.supabaseClient});
  final SupabaseClient supabaseClient;

  @override
  Future<Either<Failure, List<Service>>> getServices() async {
    try {
      List<Service> services = [];
      final jsonList = await supabaseClient.from('services').select('');
      print('bfdn ${jsonList}');
      for (var json in jsonList) {
        services.add(ServiceModel.fromJson(json).toDomain());
      }
      return right(services);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
