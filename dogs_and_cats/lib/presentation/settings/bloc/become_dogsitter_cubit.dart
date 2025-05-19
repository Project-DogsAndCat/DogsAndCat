import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/repositories/become_dogsitter_repository.dart';

part 'become_dogsitter_cubit.freezed.dart';
part 'become_dogsitter_state.dart';

class BecomeDogsitterCubit extends Cubit<BecomeDogsitterState> {
  final BecomeDogsitterRepository repository;
  BecomeDogsitterCubit({
    required this.repository,
  }) : super(const BecomeDogsitterState.initial());

  Future<void> becomeDogsitter() async {
    emit(BecomeDogsitterState.loading());

    final result = await repository.becomeDogsitter();
    result.fold(
        (failure) =>
            emit(BecomeDogsitterState.failure(message: failure.message)),
        (_) => emit(BecomeDogsitterState.success()));
  }
}
