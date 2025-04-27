import 'package:dogs_and_cats/core/error/failure.dart';
import 'package:dogs_and_cats/data/models/task/task_dto.dart';
import 'package:dogs_and_cats/domain/models/order.dart';
import 'package:dogs_and_cats/domain/repositories/task_repository.dart';
import 'package:fpdart/src/either.dart';
import 'package:fpdart/src/task.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/models/service.dart';
import '../../domain/models/task.dart';

class TaskRepositoryImpl implements TaskRepository {
  TaskRepositoryImpl({required this.supabaseClient});
  final SupabaseClient supabaseClient;
  // @override
  // Future<Either<Failure, List<Task>>> getTasks(
  //     {required List<Service> serviceIds}) async {
  //   List<String> serIds = [];
  //   serviceIds.forEach((element) => serIds.add(element.id));
  //
  //   try {
  //     final jsonList = await supabaseClient.from('orders').select('''
  //   id, service_id, date, status, duration, price,
  //   person:person_id!inner(email, phone, first_name, last_name, latitude, longitude),
  //   services:service_id!inner(id, title, description, image),
  //   pets:pet_id
  // ''').eq('status', 'В ожидании').inFilter('service_id', serIds);
  //
  //     final List<Task> tasks = jsonList
  //         .map((json) => TaskDto.fromJson(json).toDomain())
  //         .toList()
  //         .cast<Task>();
  //
  //     return right(tasks);
  //   } catch (e) {
  //     return left(Failure(message: e.toString()));
  //   }
  // }

  @override
  Future<Either<Failure, List<TaskModel>>> getTasks(
      {required List<Service> serviceIds}) async {
    try {
      List<String> serIds = serviceIds.map((element) => element.id).toList();
      final json = await supabaseClient.rpc('get_task', params: {
        'status_order': Status.waiting.value,
        'service_ids': serIds
      });
      final tasks = json
          .map((json) => TaskDto.fromJson(json).toDomain())
          .toList()
          .cast<Task>();
      return right(tasks);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
