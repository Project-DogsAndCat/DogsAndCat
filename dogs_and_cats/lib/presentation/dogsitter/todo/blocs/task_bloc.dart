import 'package:dogs_and_cats/domain/models/dogsitter.dart';
import 'package:dogs_and_cats/domain/repositories/dog_sitter_repository.dart';
import 'package:dogs_and_cats/domain/repositories/task_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/task.dart';

part 'task_bloc.freezed.dart';
part 'task_state.dart';
part 'task_event.dart';

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
    final dogsitter = await dogSitterRepository.getDogsitter();

    await dogsitter.fold((failure) {
      emit(TaskState.failure(message: failure.message));
    }, (dogsitter) async {
      if (dogsitter.status == StatusDogSitter.free) {
        final tasks =
            await taskRepository.getTasks(serviceIds: dogsitter.serviceIds);
        tasks.fold((failure) {
          emit(TaskState.failure(message: failure.message));
        }, (tasks) {
          emit(TaskState.loaded(tasks: tasks.cast<TaskModel>()));
        });
      }
    });
  }

  // final dogsitterEither = await dogSitterRepository.getDogsitter();
  //
  // await dogsitterEither.fold(
  //   (failure) async {
  //     emit(TaskState.failure(message: failure.message));
  //   },
  //   (dogsitters) async {
  //     if (dogsitters.isEmpty ||
  //         dogsitters.first.status != StatusDogSitter.free) {
  //       emit(TaskState.failure(message: 'Догситтер недоступен'));
  //       return;
  //     }
  //
  //     final serviceIds = dogsitters
  //         .map((e) => e.serviceId ?? '')
  //         .where((id) => id.isNotEmpty)
  //         .toList();
  //
  //     if (serviceIds.isEmpty) {
  //       emit(TaskState.failure(message: 'Нет доступных сервисов'));
  //       return;
  //     }
  //
  //     final tasksEither =
  //         await taskRepository.getTasks(serviceIds: serviceIds);
  //
  //     tasksEither.fold(
  //       (failure) => emit(TaskState.failure(message: failure.message)),
  //       (tasks) => emit(TaskState.loaded(tasks: tasks.cast<Task>())),
  //     );
  //   },
  // );

  Future<void> _edit(Emitter<TaskState> emit, _Edit event) async {}
}
