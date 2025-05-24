import 'package:bloc/bloc.dart';
import 'package:dogs_and_cats/domain/models/dogsitter.dart';
import 'package:dogs_and_cats/domain/repositories/distribution_repository.dart';
import 'package:dogs_and_cats/domain/repositories/dog_sitter_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/models/order.dart';
import '../../../../../domain/models/person.dart';
import '../../../../../domain/models/task.dart';
import '../../../../../domain/repositories/send_message_http_repository.dart';

part 'disrtibution_bloc.freezed.dart';
part 'disrtibution_event.dart';
part 'disrtibution_state.dart';

class DistributionBloc extends Bloc<DistributionEvent, DistributionState> {
  final DistributionRepository distributionRepository;
  final DogSitterRepository dogSitterRepository;
  final SendMessageHttpRepository sendMessageRepository;

  DistributionBloc({
    required this.distributionRepository,
    required this.dogSitterRepository,
    required this.sendMessageRepository,
  }) : super(const DistributionState.loading()) {
    on<DistributionEvent>((event, emit) async {
      await event.map(
          load: (event) => _load(emit, event),
          accept: (event) => _accept(emit, event),
          complete: (event) => _complete(emit, event));
    });
  }

  Future<void> _load(Emitter<DistributionState> emit, _Load event) async {
    final result = await distributionRepository.getDistributions(
        dogsitterId: event.dogsitter.id);
    result.fold(
        (failure) => emit(DistributionState.failure(message: failure.message)),
        (tasks) {
      final filtered =
          tasks.where((task) => task.order.status == event.status).toList();
      emit(DistributionState.loaded(tasks: filtered));
    });
  }

  Future<void> _accept(Emitter<DistributionState> emit, _Accept event) async {
    emit(DistributionState.loading());

    final result = await distributionRepository.acceptTask(
        orderId: event.orderId, dogsitterId: event.dogsitter.id);
    await result.fold((failure) async {
      if (!isClosed) emit(DistributionState.failure(message: failure.message));
    }, (_) async {
      if (!isClosed) {
        final result = await sendMessageRepository.sendMessage(
          userFcmToken: event.person.token!,
          dogsitter: event.dogsitter,
          serviceTitle: event.serviceTitle,
          order: event.order,
        );
        result.fold((failure) {
          emit(DistributionState.failure(message: failure.message));
        }, (_) {
          add(_Load(status: Status.adopted, dogsitter: event.dogsitter));
        });
      }
    });
  }

  Future<void> _complete(
      Emitter<DistributionState> emit, _Complete event) async {
    emit(DistributionState.loading());
    final result =
        await distributionRepository.completeTask(orderId: event.orderId);

    result.fold((failure) {
      if (!isClosed) emit(DistributionState.failure(message: failure.message));
    }, (_) {
      if (!isClosed) {
        add(_Load(status: Status.complete, dogsitter: event.dogsitter));
      }
    });
  }
}
