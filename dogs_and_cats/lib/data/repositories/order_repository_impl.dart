import 'package:dogs_and_cats/data/models/order/order_dto.dart';
import 'package:dogs_and_cats/domain/models/order.dart';
import 'package:dogs_and_cats/domain/repositories/order_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/error/failure.dart';
import '../../core/error/server_exception.dart';
import '../../core/utils/table_names.dart';

class OrderRepositoryImpl implements OrderRepository {
  OrderRepositoryImpl({required this.supabaseClient});
  final SupabaseClient supabaseClient;

  @override
  Future<Either<Failure, Unit>> addOrder(
      {required OrderModel order, required List<String> petIds}) async {
    try {
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
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> cancelOrder({required OrderModel order}) async {
    try {
      final dto = OrderDto.fromDomain(order);

      await supabaseClient
          .from(TableNames.orders)
          .update({'status': dto.status}).eq('id', dto.id!);
      return right(unit);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<OrderModel>>> getOrders() async {
    try {
      final personId = supabaseClient.auth.currentUser!.id;
      final json = await supabaseClient
          .from(TableNames.orders)
          .select()
          .eq('id_person', personId);

      final List<OrderModel> orders =
          json.map((json) => OrderDto.fromJson(json).toDomain()).toList();
      return right(orders);
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    }
  }
}
