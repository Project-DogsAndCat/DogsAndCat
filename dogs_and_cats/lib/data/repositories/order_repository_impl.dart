import 'dart:io';

import 'package:dogs_and_cats/data/models/order/order_dto.dart';
import 'package:dogs_and_cats/data/models/task/task_dto.dart';
import 'package:dogs_and_cats/domain/models/order.dart';
import 'package:dogs_and_cats/domain/models/task.dart';
import 'package:dogs_and_cats/domain/repositories/order_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/error/failure.dart';
import '../../core/utils/app_strings.dart';
import '../../core/utils/table_names.dart';

class OrderRepositoryImpl implements OrderRepository {
  OrderRepositoryImpl({required this.supabaseClient});
  final SupabaseClient supabaseClient;
  List<TaskModel> cache = [];

  @override
  Future<Either<Failure, Unit>> addOrder(
      {required OrderModel order, required List<String> petIds}) async {
    try {
      _clearCache();
      final dto = OrderDto.fromDomain(order);
      dto.personId = supabaseClient.auth.currentUser!.id;
      final json = dto.toJson();
      json.remove('id');

      final orderResponse = await supabaseClient
          .from(TableNames.orders)
          .insert(json)
          .select('id')
          .single();

      final orderId = orderResponse['id'];
      await supabaseClient.from(TableNames.petIdsOfOrder).insert(petIds
          .map((id) => {
                'id_order': orderId,
                'id_pet': id,
              })
          .toList());

      return right(unit);
    } on SocketException catch (_) {
      return left(Failure(message: AppString.internetNotFound));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> cancel({required String orderId}) async {
    try {
      _clearCache();

      await supabaseClient
          .from(TableNames.orders)
          .update({'status': Status.refusal.value}).eq('id', orderId);
      return right(unit);
    } on SocketException catch (_) {
      return left(Failure(message: AppString.internetNotFound));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TaskModel>>> getOrders() async {
    try {
      if (cache.isNotEmpty) return right(cache.cast<TaskModel>());
      final personId = supabaseClient.auth.currentUser!.id;

      final json = await supabaseClient.rpc('get_order', params: {
        'curr_person_id': personId,
      });

      if (json == null) return right([]);

      final tasks = json
          .map((json) => TaskDto.fromJson(json).toDomain())
          .toList()
          .cast<TaskModel>();
      _updateCache(tasks);
      return right(tasks);
    } on SocketException catch (_) {
      return left(Failure(message: AppString.internetNotFound));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  // @override
  // Future<List<TaskModel>> getOrderInfoWithFilter(Status status) async {
  //   if (cache.isEmpty) await getOrders();
  //
  //   return cache
  //       .where((task) => task.order.status.value == status.value)
  //       .toList()
  //       .cast<TaskModel>();
  // }

  void _clearCache() {
    cache.clear();
  }

  void _updateCache(List<TaskModel> data) {
    cache = data;
  }
}
