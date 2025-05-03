import 'package:dogs_and_cats/domain/models/dogsitter.dart';
import 'package:dogs_and_cats/domain/repositories/dog_sitter_repository.dart';
import 'package:dogs_and_cats/domain/repositories/task_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/order.dart';
import '../../../../domain/models/task.dart';

part 'task_bloc.freezed.dart';
part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository taskRepository;
  final DogSitterRepository dogSitterRepository;
  TaskBloc({
    required this.taskRepository,
    required this.dogSitterRepository,
  }) : super(TaskState.loading()) {
    on<TaskEvent>((event, emit) async {
      await event.map(
          load: (event) => _load(emit, event),
          accept: (event) => _accept(emit, event));
    });
  }

  Future<void> _load(Emitter<TaskState> emit, _Load event) async {
    final dogsitter = await dogSitterRepository.getDogsitter();

    await dogsitter.fold((failure) {
      emit(TaskState.failure(message: failure.message));
    }, (dogsitter) async {
      if (dogsitter.status == StatusDogSitter.free) {
        final tasks = await taskRepository.getTasks(
            dogsitter: dogsitter, status: event.status);

        tasks.fold((failure) {
          emit(TaskState.failure(message: failure.message));
        }, (tasks) {
          emit(TaskState.loaded(tasks: tasks.cast<TaskModel>()));
        });
      } else {
        emit(TaskState.loaded(tasks: []));
      }
    });
  }

  Future<void> _accept(Emitter<TaskState> emit, _Accept event) async {
    emit(TaskState.loading());

    final result = await taskRepository.updateStatus(
        prevStatus: event.prevStatus,
        newStatus: event.newStatus,
        orderId: event.orderId);

    result.fold((failure) => emit(TaskState.failure(message: failure.message)),
        (orders) => add(_Load(status: event.prevStatus)));
  }
}
