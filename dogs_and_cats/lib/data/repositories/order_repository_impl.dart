import 'dart:async';
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
    } on SocketException catch (_) {
      return left(Failure(message: AppString.internetNotFound));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> cancel({required String orderId}) async {
    try {
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
  Stream<Either<Failure, List<TaskModel>>> watchOrders() {
    final controller = StreamController<Either<Failure, List<TaskModel>>>();
    final person = supabaseClient.auth.currentUser;
    if (person == null) {
      controller.add(left(Failure(message: "User not authenticated")));
      return controller.stream;
    }
    RealtimeChannel? channel;
    try {
      channel = supabaseClient
          .channel('order_changes')
          .onPostgresChanges(
              event: PostgresChangeEvent.all,
              schema: 'public',
              table: TableNames.orders,
              filter: PostgresChangeFilter(
                  type: PostgresChangeFilterType.eq,
                  column: 'person_id',
                  value: person.id),
              callback: (_) => _handleOrderChange(controller))
          .subscribe(
        (status, [error]) {
          if (status == RealtimeSubscribeStatus.subscribed) {
            _handleOrderChange(controller);
          }
          if (status == RealtimeSubscribeStatus.channelError) {
            controller.add(left(Failure(message: "Subscription error")));
          }
        },
      );
    } catch (e) {
      controller.add(left(Failure(message: e.toString())));
    }
    controller.onCancel = () {
      channel?.unsubscribe();
      controller.close();
    };
    return controller.stream;
  }

  void _handleOrderChange(
    StreamController<Either<Failure, List<TaskModel>>> controller,
  ) async {
    try {
      final result = await _getOrders();
      controller.add(result);
    } catch (e) {
      controller.add(left(Failure(message: e.toString())));
    }
  }

  Future<Either<Failure, List<TaskModel>>> _getOrders() async {
    try {
      final personId = supabaseClient.auth.currentUser!.id;
      final json = await supabaseClient.rpc('get_order', params: {
        'curr_person_id': personId,
      });
      if (json == null) return right([]);
      final tasks = json
          .map((json) => TaskDto.fromJson(json).toDomain())
          .toList()
          .cast<TaskModel>();
      return right(tasks);
    } on SocketException catch (_) {
      return left(Failure(message: AppString.internetNotFound));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateScore(
      {required double rating, required String orderId}) async {
    try {
      await supabaseClient
          .from(TableNames.orders)
          .update({'score': rating}).eq('id', orderId);
      return right(unit);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
