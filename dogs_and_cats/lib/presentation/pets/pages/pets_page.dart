import 'package:dogs_and_cats/core/utils/app_strings.dart';
import 'package:dogs_and_cats/presentation/pets/blocs/pet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../account/widgets/custom_profile_button.dart';

class PetsPage extends StatelessWidget {
  const PetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.myPets),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        child: Column(
          children: [
            BlocBuilder<PetBloc, PetState>(builder: (context, state) {
              return state.map(
                  loading: (_) => Center(
                        child: CircularProgressIndicator(),
                      ),
                  loaded: (state) => Expanded(
                        child: ListView.builder(
                            padding: const EdgeInsets.all(8),
                            itemCount: state.pets.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CustomProfileButton(
                                mainInfoTitle:
                                    state.pets[index].name.toString(),
                                otherInfoTitle:
                                    state.pets[index].description == null
                                        ? 'Без особенностей'
                                        : 'Есть особенности',
                                icon: Icons.add,
                                onPressed: () {},
                              );
                            }),
                      ),
                  failure: (state) => Text(state.message));
            }),
          ],
        ),
      ),
    );
  }
}
