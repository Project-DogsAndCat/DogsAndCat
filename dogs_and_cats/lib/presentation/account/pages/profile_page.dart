import 'package:dogs_and_cats/domain/models/person.dart';
import 'package:dogs_and_cats/presentation/account/blocs/profile_bloc.dart';
import 'package:dogs_and_cats/presentation/account/pages/bottom_sheet_edit_page.dart';
import 'package:dogs_and_cats/presentation/account/widgets/custom_profile_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/route_names.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/widgets/custom_text_form_field.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.profile),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        child:
            BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
          return state.map(
            loading: (_) => Center(
              child: CircularProgressIndicator(),
            ),
            loaded: (value) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _initControllers(value.person);
              });
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomProfileButton(
                    onPressed: () {
                      showModalBottomSheet<void>(
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CustomProfileButton(
                                      mainInfoTitle:
                                          '${value.person.firstName} ${value.person.lastName}',
                                      icon: Icons.person,
                                      onPressed: () {
                                        _showEditBottomSheet(
                                            context,
                                            BottomSheetEditPage(
                                                title:
                                                    AppString.firstAndLastName,
                                                fields: [
                                                  CustomTextFormField(
                                                    controller:
                                                        _firstNameController,
                                                    hintText:
                                                        AppString.firstName,
                                                    keyboardType:
                                                        TextInputType.text,
                                                    obscureText: false,
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return AppString
                                                            .required;
                                                      }
                                                      return null;
                                                    },
                                                  ),
                                                  const SizedBox(height: 10.0),
                                                  CustomTextFormField(
                                                    controller:
                                                        _lastNameController,
                                                    hintText:
                                                        AppString.lastName,
                                                    keyboardType:
                                                        TextInputType.text,
                                                    obscureText: false,
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return AppString
                                                            .required;
                                                      }
                                                      return null;
                                                    },
                                                  ),
                                                ],
                                                onSave: () {
                                                  context
                                                      .read<ProfileBloc>()
                                                      .add(ProfileEvent.edit(
                                                        person: Person(
                                                          firstName:
                                                              _firstNameController
                                                                  .text,
                                                          lastName:
                                                              _lastNameController
                                                                  .text,
                                                        ),
                                                      ));
                                                }));
                                      }),
                                  CustomProfileButton(
                                      mainInfoTitle: '${value.person.phone}',
                                      icon: Icons.person,
                                      onPressed: () {
                                        _showEditBottomSheet(
                                            context,
                                            BottomSheetEditPage(
                                                title: AppString.phone,
                                                fields: [
                                                  CustomTextFormField(
                                                    controller:
                                                        _phoneController,
                                                    hintText: AppString.phone,
                                                    keyboardType:
                                                        TextInputType.text,
                                                    obscureText: false,
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return AppString
                                                            .required;
                                                      }
                                                      return null;
                                                    },
                                                  ),
                                                ],
                                                onSave: () {
                                                  context
                                                      .read<ProfileBloc>()
                                                      .add(ProfileEvent.edit(
                                                        person: Person(
                                                          phone:
                                                              _phoneController
                                                                  .text,
                                                        ),
                                                      ));
                                                  Navigator.pop(context);
                                                }));
                                      }),
                                  CustomProfileButton(
                                      mainInfoTitle: '${value.person.email}',
                                      icon: Icons.person,
                                      onPressed: () {
                                        _showEditBottomSheet(
                                            context,
                                            BottomSheetEditPage(
                                                title: AppString.email,
                                                fields: [
                                                  CustomTextFormField(
                                                    controller:
                                                        _emailController,
                                                    hintText: AppString.email,
                                                    keyboardType:
                                                        TextInputType.text,
                                                    obscureText: false,
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return AppString
                                                            .required;
                                                      }
                                                      return null;
                                                    },
                                                  ),
                                                ],
                                                onSave: () {
                                                  context
                                                      .read<ProfileBloc>()
                                                      .add(ProfileEvent.edit(
                                                        person: Person(
                                                          email:
                                                              _emailController
                                                                  .text,
                                                        ),
                                                      ));
                                                  Navigator.pop(context);
                                                }));
                                      }),
                                ],
                              ),
                            );
                          });
                    },
                    mainInfoTitle: value.person.firstName ?? '',
                    otherInfoTitle: value.person.lastName,
                    icon: Icons.add,
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  CustomProfileButton(
                      onPressed: () {
                        context.goNamed(RoutesNames.pets);
                      },
                      mainInfoTitle: AppString.myPets,
                      icon: Icons.pets)
                  // MapScreen(),
                ],
              );
            },
            failure: (state) => Text(state.message),
          );
        }),
      ),
    );
  }

  void _showEditBottomSheet(BuildContext context, BottomSheetEditPage page) {
    Navigator.pop(context);
    showModalBottomSheet<void>(
        context: context,
        builder: (newContext) {
          return page;
        });
  }

  void _initControllers(Person person) {
    _firstNameController.text = person.firstName ?? '';
    _lastNameController.text = person.lastName ?? '';
    _emailController.text = person.email ?? '';
    _phoneController.text = person.phone ?? '';
  }
}
