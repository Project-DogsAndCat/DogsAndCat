import 'package:dogs_and_cats/domain/repositories/dog_sitter_repository.dart';
import 'package:dogs_and_cats/domain/repositories/task_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/task.dart';

part 'task_bloc.freezed.dart';
part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository taskRepository;
  final DogSitterRepository dogSitterRepository;
  TaskBloc({required this.taskRepository, required this.dogSitterRepository})
      : super(TaskState.loading()) {
    on<TaskEvent>((event, emit) async {
      await event.map(
          load: (event) => _load(emit, event),
          edit: (event) => _edit(emit, event));
    });
  }

  Future<void> _load(Emitter<TaskState> emit, _Load event) async {
    // final dogsitter = await dogSitterRepository.getDogsitter();
    //
    // await dogsitter.fold((failure) {
    //   emit(TaskState.failure(message: failure.message));
    // }, (dogsitter) async {
    //   if (dogsitter.status == StatusDogSitter.free) {
    final tasks = await taskRepository.getTasks(serviceIds: [
      '2ff7ae11-acd8-48ca-92a8-03a2c1c0bf6a',
      '04ea3312-3776-4729-a76f-1717cca05d98'
    ]);
    tasks.fold((failure) {
      emit(TaskState.failure(message: failure.message));
    }, (tasks) {
      emit(TaskState.loaded(tasks: tasks.cast<Task>()));
    });
    //   }
    // });
  }

  Future<void> _edit(Emitter<TaskState> emit, _Edit event) async {}
}
