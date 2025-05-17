import 'package:dogs_and_cats/domain/models/dogsitter.dart';
import 'package:dogs_and_cats/domain/models/order.dart';
import 'package:dogs_and_cats/domain/repositories/dog_sitter_repository.dart';
import 'package:dogs_and_cats/domain/repositories/task_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/person.dart';
import '../../../../domain/models/task.dart';
import '../../../../domain/repositories/send_message_http_repository.dart';

part 'task_bloc.freezed.dart';
part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository taskRepository;
  final DogSitterRepository dogSitterRepository;
  final SendMessageHttpRepository sendMessageRepository;
  TaskBloc({
    required this.taskRepository,
    required this.dogSitterRepository,
    required this.sendMessageRepository,
  }) : super(TaskState.loading()) {
    on<TaskEvent>((event, emit) async {
      await event.map(
        loadAllTask: (_) => _loadAllTask(emit),
        loadAcceptedTask: (_) => _loadAcceptedTask(emit),
        loadCompletedTask: (_) => _loadCompletedTask(emit),
        accept: (event) => _accept(emit, event),
        complete: (event) => _complete(emit, event),
      );
    });
  }

  Future<void> _loadAllTask(Emitter<TaskState> emit) async {
    emit(TaskState.loading());
    final dogsitter = await dogSitterRepository.getDogsitter();

    await dogsitter.fold((failure) {
      emit(TaskState.failure(message: failure.message));
    }, (dogsitter) async {
      if (dogsitter.status == StatusDogSitter.free) {
        final tasks = await taskRepository.getAllTasks(dogsitter: dogsitter);
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

  Future<void> _loadAcceptedTask(Emitter<TaskState> emit) async {
    final dogsitter = await dogSitterRepository.getDogsitter();

    await dogsitter.fold((failure) {
      emit(TaskState.failure(message: failure.message));
    }, (dogsitter) async {
      final tasks =
          await taskRepository.getDistributions(dogsitterId: dogsitter.id);
      tasks.fold((failure) {
        emit(TaskState.failure(message: failure.message));
      }, (tasks) {
        final filtered =
            tasks.where((task) => task.order.status == Status.adopted).toList();
        emit(TaskState.loaded(tasks: filtered));
      });
    });
  }

  Future<void> _loadCompletedTask(Emitter<TaskState> emit) async {
    final dogsitter = await dogSitterRepository.getDogsitter();

    await dogsitter.fold((failure) {
      emit(TaskState.failure(message: failure.message));
    }, (dogsitter) async {
      final tasks =
          await taskRepository.getDistributions(dogsitterId: dogsitter.id);
      tasks.fold((failure) {
        emit(TaskState.failure(message: failure.message));
      }, (tasks) {
        final filtered = tasks
            .where((task) => task.order.status == Status.complete)
            .toList();
        emit(TaskState.loaded(tasks: filtered));
      });
    });
  }

  Future<void> _accept(Emitter<TaskState> emit, _Accept event) async {
    emit(TaskState.loading());
    final updateResult =
        await dogSitterRepository.updateStatus(status: StatusDogSitter.busy);

    await updateResult.fold<Future<void>>(
        (failure) async => emit(TaskState.failure(message: failure.message)),
        (_) async {
      final dogsitterResult = await dogSitterRepository.getDogsitter();
      await dogsitterResult.fold<Future<void>>(
          (failure) async => emit(TaskState.failure(message: failure.message)),
          (dogsitter) async {
        final result = await Future.wait([
          taskRepository.acceptTask(
              orderId: event.orderId, dogsitterId: dogsitter.id),
          sendMessageRepository.sendMessage(
              userFcmToken: event.person.token!,
              dogsitter: dogsitter.person.firstName!)
        ]);
        result[0].fold(
            (failure) => emit(TaskState.failure(message: failure.message)),
            (_) => add(_LoadAllTask()));
      });
    });
  }

  Future<void> _complete(Emitter<TaskState> emit, _Complete event) async {
    emit(TaskState.loading());
    final updateResult =
        await dogSitterRepository.updateStatus(status: StatusDogSitter.free);

    await updateResult.fold<Future<void>>(
        (failure) async => emit(TaskState.failure(message: failure.message)),
        (_) async {
      final completeResult =
          await taskRepository.completeTask(orderId: event.orderId);

      completeResult.fold(
          (failure) => emit(TaskState.failure(message: failure.message)),
          (_) => add(_LoadAcceptedTask()));
    });
  }
}
