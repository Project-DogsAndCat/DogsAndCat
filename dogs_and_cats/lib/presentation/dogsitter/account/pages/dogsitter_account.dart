import 'package:dogs_and_cats/core/utils/app_strings.dart';
import 'package:dogs_and_cats/presentation/account/widgets/custom_profile_button.dart';
import 'package:dogs_and_cats/presentation/dogsitter/account/widgets/rating_bar_indicator_widget.dart';
import 'package:dogs_and_cats/presentation/dogsitter/adding_information/blocs/dog_sitter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/pages/failure_page.dart';
import '../../../../core/theme/theme.dart';
import '../../../../core/widgets/custom_snackbar.dart';
import '../../../account/blocs/profile_bloc/profile_bloc.dart';
import '../../../account/pages/edit_page.dart';
import '../../../account/pages/map_page.dart';
import '../../../auth/blocs/auth_bloc/auth_bloc.dart';
import '../widgets/profile_avatar.dart';

class DogsitterAccount extends StatefulWidget {
  const DogsitterAccount({super.key});

  @override
  State<DogsitterAccount> createState() => _DogsitterAccountState();
}

class _DogsitterAccountState extends State<DogsitterAccount> {
  @override
  void initState() {
    context.read<ProfileBloc>().add(ProfileEvent.load());
    context.read<DogSitterBloc>().add(DogSitterEvent.load());
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
                    loading: (_) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                    loaded: (state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: ProfileAvatar(
                              person: state.person,
                            ),
                          ),
                          const SizedBox(
                            height: 25.0,
                          ),
                          Text(
                            AppString.rating,
                            style: textTheme.labelLarge,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          BlocBuilder<DogSitterBloc, DogSitterState>(
                              builder: (context, state) {
                            return state.map(
                              initial: (_) => Container(),
                              loading: (_) => CircularProgressIndicator(),
                              loaded: (state) => Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    state.dogsitter.rating.toStringAsFixed(1),
                                    style: textTheme.titleLarge,
                                  ),
                                  RatingBarIndicatorWidget(
                                    rating: state.dogsitter.rating,
                                  ),
                                ],
                              ),
                              failure: (_) => Container(),
                            );
                          }),
                          const SizedBox(
                            height: 25.0,
                          ),
                          Text(
                            AppString.personalData,
                            style: textTheme.labelLarge,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomProfileButton(
                            onPressed: () {
                              final bloc =
                                  BlocProvider.of<ProfileBloc>(context);
                              showModalBottomSheet<void>(
                                isScrollControlled: true,
                                context: context,
                                builder: (BuildContext context) {
                                  return BlocProvider.value(
                                    value: bloc,
                                    child: EditPage(
                                      person: state.person,
                                    ),
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
