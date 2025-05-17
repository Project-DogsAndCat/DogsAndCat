import 'package:dogs_and_cats/core/pages/failure_page.dart';
import 'package:dogs_and_cats/presentation/account/blocs/profile_bloc/profile_bloc.dart';
import 'package:dogs_and_cats/presentation/account/pages/edit_page.dart';
import 'package:dogs_and_cats/presentation/account/widgets/custom_profile_button.dart';
import 'package:dogs_and_cats/presentation/auth/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/route_names.dart';
import '../../../core/theme/theme.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/widgets/custom_snackbar.dart';
import 'map_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    context.read<ProfileBloc>().add(ProfileEvent.load());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppString.profile,
          style: textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            state.map(
              authorized: (_) {},
              notAuthorized: (_) {},
              failure: (state) =>
                  CustomSnackBar.showError(context, state.message),
            );
          },
          child: BlocListener<ProfileBloc, ProfileState>(
            listener: (context, state) {
              state.map(
                initial: (_) {},
                loading: (_) {},
                loaded: (_) {},
                failure: (state) =>
                    CustomSnackBar.showError(context, state.message),
              );
            },
            child: BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                return state.map(
                    initial: (_) => Container(),
                    loading: (_) => Center(
                          child: CircularProgressIndicator(),
                        ),
                    loaded: (state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppString.personalData,
                            style: textTheme.labelLarge,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
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
                          Text(
                            AppString.myPets,
                            style: textTheme.labelLarge,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomProfileButton(
                              onPressed: () {
                                context.goNamed(RoutesNames.pets,
                                    pathParameters: {
                                      'backPage': RoutesNames.account
                                    });
                              },
                              mainInfoTitle: AppString.pets,
                              icon: Icons.pets),
                          const SizedBox(
                            height: 25.0,
                          ),
                          Text(
                            AppString.myAddress,
                            style: textTheme.labelLarge,
                          ),
                          const SizedBox(
                            height: 10,
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
                          const SizedBox(
                            height: 10.0,
                          ),
                          CustomProfileButton(
                              onPressed: () {
                                context
                                    .read<AuthBloc>()
                                    .add(AuthEvent.userLogOut());
                                context.goNamed(RoutesNames.choseRole);
                              },
                              mainInfoTitle: AppString.logout,
                              icon: Icons.exit_to_app),
                        ],
                      );
                    },
                    failure: (failure) => FailurePage(
                        message: failure.message,
                        onPressed: () {
                          context.read<ProfileBloc>().add(ProfileEvent.retry());
                        }));
              },
            ),
          ),
        ),
      ),
    );
  }
}
