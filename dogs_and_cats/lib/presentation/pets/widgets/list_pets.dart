import 'package:dogs_and_cats/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../account/widgets/custom_profile_button.dart';
import '../blocs/pet_bloc/pet_bloc.dart';
import '../pages/edit_pet_page.dart';

class ListPets extends StatelessWidget {
  const ListPets({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PetBloc, PetState>(builder: (context, state) {
      return state.map(
          loading: (_) => SliverFillRemaining(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          loaded: (state) => SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: CustomProfileButton(
                      mainInfoTitle: state.pets[index].name.toString(),
                      otherInfoTitle:
                          state.pets[index].selectedCategory.isEmpty &&
                                  state.pets[index].otherFeatures.isEmpty
                              ? AppString.usualPet
                              : AppString.unusualPet,
                      icon: Icons.add,
                      onPressed: () {
                        showModalBottomSheet<void>(
                          isScrollControlled: true,
                          context: context,
                          builder: (newContext) {
                            return EditPetPage(
                              pet: state.pets[index],
                            );
                          },
                        );
                      },
                    ),
                  );
                }, childCount: state.pets.length),
              ),
          failure: (state) => SliverFillRemaining(child: Text(state.message)));
    });
  }
}
