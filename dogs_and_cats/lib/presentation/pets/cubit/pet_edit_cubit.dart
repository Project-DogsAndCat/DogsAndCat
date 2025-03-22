import 'package:bloc/bloc.dart';
import 'package:dogs_and_cats/domain/models/pet.dart';

part 'pet_edit_state.dart';

class PetEditCubit extends Cubit<PetEditState> {
  PetEditCubit(Pet pet)
      : super(PetEditState(
            features: pet.features?.split(',').toSet() ?? {},
            otherFeatures: pet.otherFeatures ?? ''));

  void updateFeatures(Set<String> features, String otherFeatures) {
    emit(state.copyWith(features, otherFeatures));
  }
}
