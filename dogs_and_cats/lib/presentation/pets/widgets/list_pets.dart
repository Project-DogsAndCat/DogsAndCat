import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../account/widgets/custom_profile_button.dart';
import '../blocs/pet_bloc.dart';

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
                      otherInfoTitle: state.pets[index].features == null
                          ? 'Без особенностей'
                          : 'Есть особенности',
                      icon: Icons.add,
                      onPressed: () {},
                    ),
                  );
                }, childCount: state.pets.length),
              ),
          failure: (state) => SliverFillRemaining(child: Text(state.message)));
    });
  }
}
