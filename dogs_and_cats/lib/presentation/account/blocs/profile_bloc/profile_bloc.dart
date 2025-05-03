import 'package:dogs_and_cats/domain/repositories/person_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/person.dart';

part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final PersonRepository repository;
  ProfileBloc({required this.repository}) : super(ProfileState.loading()) {
    on<ProfileEvent>((event, emit) async {
      await event.map(
        load: (_) => _load(emit),
        retry: (_) => _retry(emit),
        edit: (event) => _edit(event, emit),
        editEmail: (event) => _ediEmail(event, emit),
      );
    });
  }

  Future<void> _load(Emitter<ProfileState> emit) async {
    final result = await repository.getPerson();

    result.fold(
        (failure) => emit(ProfileState.failure(message: failure.message)),
        (person) => emit(ProfileState.loaded(person: person)));
  }

  Future<void> _edit(_Edit event, Emitter<ProfileState> emit) async {
    emit(ProfileState.loading());

    final result = await repository.updatePerson(
      originalPerson: event.originalPerson,
      updatePerson: event.updatePerson,
    );

    result.fold(
        (failure) => emit(ProfileState.failure(message: failure.message)),
        (_) => add(_Load()));
  }

  Future<void> _ediEmail(_EditEmail event, Emitter<ProfileState> emit) async {
    emit(ProfileState.loading());

    final result = await repository.updateEmail(email: event.email);

    result.fold(
        (failure) => emit(ProfileState.failure(message: failure.message)),
        (_) => add(_Load()));
  }

  Future<void> _retry(Emitter<ProfileState> emit) async {
    emit(ProfileState.loading());
    add(_Load());
  }
}
