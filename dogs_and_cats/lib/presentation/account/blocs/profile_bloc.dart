import 'package:dogs_and_cats/core/dependency/dependencies.dart';
import 'package:dogs_and_cats/domain/repositories/person_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../data/models/person/person_dto.dart';
import '../../../domain/models/person.dart';

part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final PersonRepository repository;

  final _session = getIt<SupabaseClient>().auth.currentSession!.user;
  ProfileBloc({required this.repository}) : super(ProfileState.loading()) {
    on<ProfileEvent>((event, emit) async {
      await event.map(
        load: (event) => _load(event, emit),
        edit: (event) => _edit(event, emit),
      );
    });
  }

  Future<void> _load(_Load event, Emitter<ProfileState> emit) async {
    final result = await repository.getPerson(id: _session.id);
    result.fold(
        (failure) => emit(ProfileState.failure(message: failure.message)),
        (person) => emit(ProfileState.loaded(person: person)));
  }

  Future<void> _edit(_Edit event, Emitter<ProfileState> emit) async {
    emit(ProfileState.loading());
    final result =
        await repository.updatePerson(id: _session.id, dto: event.dto);
    result.fold(
        (failure) => emit(ProfileState.failure(message: failure.message)),
        (_) => add(_Load()));
  }
}
