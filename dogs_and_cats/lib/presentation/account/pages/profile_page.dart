import 'package:dogs_and_cats/presentation/account/blocs/profile_bloc/profile_bloc.dart';
import 'package:dogs_and_cats/presentation/account/pages/edit_page.dart';
import 'package:dogs_and_cats/presentation/account/widgets/custom_profile_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/route_names.dart';
import '../../../core/utils/app_strings.dart';
import 'map_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.profile),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return state.map(
              loading: (_) => Center(
                child: CircularProgressIndicator(),
              ),
              loaded: (state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomProfileButton(
                      onPressed: () {
                        showModalBottomSheet<void>(
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return EditPage(
                              person: state.person,
                            );
                          },
                        );
                      },
                      mainInfoTitle: state.person.firstName ?? '',
                      otherInfoTitle: state.person.lastName,
                      icon: Icons.add,
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    CustomProfileButton(
                        onPressed: () {
                          context.goNamed(RoutesNames.pets, pathParameters: {
                            'backPage': RoutesNames.account
                          });
                        },
                        mainInfoTitle: AppString.myPets,
                        icon: Icons.pets),
                    const SizedBox(
                      height: 25.0,
                    ),
                    CustomProfileButton(
                      onPressed: () {
                        showModalBottomSheet<void>(
                          isScrollControlled: true,
                          context: context,
                          enableDrag: false,
                          builder: (newContext) {
                            return MapPage(
                              person: state.person,
                            );
                          },
                        );
                      },
                      mainInfoTitle: AppString.address,
                      icon: Icons.map,
                    ),
                  ],
                );
              },
              failure: (state) => Text(state.message),
            );
          },
        ),
      ),
    );
  }
}
