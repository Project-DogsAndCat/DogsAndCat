import 'package:dogs_and_cats/data/models/pet/pet_dto.dart';
import 'package:dogs_and_cats/data/models/pet/pet_edit_dto.dart';
import 'package:dogs_and_cats/domain/models/pet.dart';
import 'package:dogs_and_cats/domain/repositories/pet_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'pet_bloc.freezed.dart';
part 'pet_event.dart';
part 'pet_state.dart';

class PetBloc extends Bloc<PetEvent, PetState> {
  final PetRepository repository;
  final SupabaseClient supabaseClient;

  PetBloc({required this.repository, required this.supabaseClient})
      : super(PetState.loading()) {
    on<PetEvent>((event, emit) async {
      await event.map(
        load: (event) => _load(event, emit),
        edit: (event) => _edit(event, emit),
        add: (event) => _add(event, emit),
      );
    });
  }

  Future<void> _load(_Load event, Emitter<PetState> emit) async {
    final result =
        await repository.getPets(id: supabaseClient.auth.currentUser!.id);
    result.fold((failure) => emit(PetState.failure(message: failure.message)),
        (pets) => emit(PetState.loaded(pets: pets)));
  }

  Future<void> _edit(_Edit event, Emitter<PetState> emit) async {
    emit(PetState.loading());

    final result =
        await repository.updatePet(pet: PetEditDto.fromDomain(event.pet));
    result.fold((failure) => emit(PetState.failure(message: failure.message)),
        (_) => add(_Load()));
  }

  Future<void> _add(_Add event, Emitter<PetState> emit) async {
    emit(PetState.loading());

    final result = await repository.addPet(dto: PetDto.fromDomain(event.pet));
    result.fold((failure) => emit(PetState.failure(message: failure.message)),
        (_) => add(_Load()));
  }
}
