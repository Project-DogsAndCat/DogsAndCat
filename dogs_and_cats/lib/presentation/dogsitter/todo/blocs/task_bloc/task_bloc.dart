import 'dart:async';

import 'package:dogs_and_cats/domain/repositories/dog_sitter_repository.dart';
import 'package:dogs_and_cats/domain/repositories/task_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../domain/models/dogsitter.dart';
import '../../../../../domain/models/task.dart';

part 'task_bloc.freezed.dart';
part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository taskRepository;
  final DogSitterRepository dogSitterRepository;
  StreamSubscription<Either<Failure, List<TaskModel>>>? _subscription;

  TaskBloc({
    required this.taskRepository,
    required this.dogSitterRepository,
  }) : super(TaskState.loading()) {
    on<TaskEvent>((event, emit) async {
      await event.map(
        initialize: (event) => _initialize(emit, event),
        tasksUpdated: (event) => _tasksUpdated(emit, event),
      );
    });
  }

  Future<void> _initialize(Emitter<TaskState> emit, _Initialize event) async {
    if (event.dogsitter.status == StatusDogSitter.free) {
      _subscription = taskRepository
          .watchTasks(dogsitter: event.dogsitter)
          .listen((result) {
        add(TaskEvent.tasksUpdated(result: result));
      });
    } else {
      emit(TaskState.loaded(tasks: []));
    }
  }

  Future<void> _tasksUpdated(
      Emitter<TaskState> emit, _TasksUpdated event) async {
    event.result.fold(
      (failure) => emit(TaskState.failure(message: failure.message)),
      (tasks) => emit(TaskState.loaded(tasks: tasks)),
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
