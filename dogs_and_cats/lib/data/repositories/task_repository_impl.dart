import 'package:dogs_and_cats/core/error/failure.dart';
import 'package:dogs_and_cats/data/models/task/task_dto.dart';
import 'package:dogs_and_cats/domain/repositories/task_repository.dart';
import 'package:fpdart/src/either.dart';
import 'package:fpdart/src/task.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TaskRepositoryImpl implements TaskRepository {
  TaskRepositoryImpl({required this.supabaseClient});
  final SupabaseClient supabaseClient;
  @override
  Future<Either<Failure, List<Task>>> getTasks(
      {required List<String> serviceIds}) async {
    try {
      final jsonList = await supabaseClient.from('orders').select('''
    id,
    service_id,
    date,
    status,
    duration,
    price,
    person:person_id!inner(
      email,
      phone,
      first_name,
      last_name,
      latitude,
      longitude
    ),
    services:service_id!inner(
      id,
      title,
      description,
      image
    )
  ''').eq('status', 'В ожидании').inFilter('service_id', serviceIds);

      final List<Task> tasks = jsonList
          .map((json) => TaskDto.fromJson(json).toDomain())
          .toList()
          .cast<Task>();

      return right(tasks);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
