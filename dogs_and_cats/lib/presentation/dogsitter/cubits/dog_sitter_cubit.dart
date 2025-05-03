import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/dogsitter.dart';
import '../../../domain/repositories/dog_sitter_repository.dart';

part 'dog_sitter_cubit.freezed.dart';
part 'dog_sitter_state.dart';

class DogSitterCubit extends Cubit<DogSitterState> {
  final DogSitterRepository repository;
  DogSitterCubit({required this.repository})
      : super(const DogSitterState.loading());

  Future<void> getDogsitter() async {
    final result = await repository.getDogsitter();

    result.fold(
        (failure) => emit(DogSitterState.failure(message: failure.message)),
        (dogsitter) => emit(DogSitterState.loaded(dogsitter: dogsitter)));
  }
}
