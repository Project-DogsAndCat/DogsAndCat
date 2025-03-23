import 'package:bloc/bloc.dart';
import 'package:dogs_and_cats/domain/models/pet.dart';

part 'pet_edit_state.dart';

class PetEditCubit extends Cubit<PetEditState> {
  PetEditCubit({Pet? pet})
      : super(PetEditState(
            selectedCategory: pet?.selectedCategory
                .split(',')
                .map((element) => element.trim())
                .toSet(),
            otherFeatures: pet?.otherFeatures));

  void updateFeatures({Set<String>? selectedCategory, String? otherFeatures}) {
    emit(state.copyWith(
        selectedCategory: selectedCategory, otherFeatures: otherFeatures));
  }
}
