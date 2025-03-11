import 'package:dogs_and_cats/core/widgets/rounded_elevated_button.dart';
import 'package:dogs_and_cats/presentation/account/blocs/profile_bloc.dart';
import 'package:dogs_and_cats/presentation/account/widgets/custom_profile_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_strings.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../../../data/models/person/person_dto.dart';
import '../widgets/bottom_sheet_info.dart';
import '../widgets/map_screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _registerFormKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

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
                if (_firstNameController.text != value.person.firstName) {
                  _firstNameController.text = value.person.firstName;
                }
                if (_lastNameController.text != value.person.lastName) {
                  _lastNameController.text = value.person.lastName;
                }
                if (_emailController.text != value.person.email) {
                  _emailController.text = value.person.email;
                }
                if (_phoneController.text != value.person.phone) {
                  _phoneController.text = value.person.phone ?? '';
                }
              });

              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomProfileButton(
                    onPressed: () {
                      _showProfileBottomSheet(context, value);
                    },
                    mainInfoTitle: value.person.firstName,
                    otherInfoTitle: value.person.lastName,
                    icon: Icons.add,
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  MapScreen(),
                ],
              );
            },
            failure: (state) => Text(state.message),
          );
        }),
      ),
    );
  }

  void _showProfileBottomSheet(BuildContext mainContext, value) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: mainContext,
      builder: (BuildContext context) {
        return BottomSheetInfo(
          widgets: [
            CustomProfileButton(
              mainInfoTitle:
                  '${value.person.firstName} ${value.person.lastName}',
              icon: Icons.add_ic_call,
              onPressed: () {
                Navigator.pop(context);
                _showEditNameBottomSheet(mainContext, value);
              },
            ),
            CustomProfileButton(
              mainInfoTitle: value.person.phone ?? 'Укажите номер телефона',
              icon: Icons.add_ic_call,
              onPressed: () {
                Navigator.pop(context);
                _showEditPhoneBottomSheet(mainContext, value);
              },
            ),
            CustomProfileButton(
              mainInfoTitle: value.person.email,
              icon: Icons.add_ic_call,
              onPressed: () {
                Navigator.pop(context);
                _showEditEmailBottomSheet(mainContext);
              },
            ),
          ],
        );
      },
    );
  }

  void _showEditBottomSheet({
    required BuildContext mainContext,
    required String title,
    required List<Widget> fields,
    required VoidCallback onSave,
  }) {
    showModalBottomSheet<void>(
      context: mainContext,
      builder: (context) {
        return Form(
          key: _registerFormKey,
          child: BottomSheetInfo(
            widgets: [
              Text(title),
              ...fields,
              const SizedBox(height: 10.0),
              RoundedElevatedButton(
                onPressed: () {
                  if (_registerFormKey.currentState!.validate()) {
                    onSave();
                    Navigator.pop(context);
                  }
                },
                widget: const Text('Update'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showEditNameBottomSheet(BuildContext context, value) {
    _showEditBottomSheet(
        mainContext: context,
        title: AppString.firstAndLastName,
        fields: [
          CustomTextFormField(
            controller: _firstNameController,
            hintText: 'Введите Имя',
            keyboardType: TextInputType.text,
            obscureText: false,
            validator: (value) {
              if (value!.isEmpty) return AppString.required;
              return null;
            },
          ),
          const SizedBox(height: 10.0),
          CustomTextFormField(
            controller: _lastNameController,
            hintText: 'Введите фамилию',
            keyboardType: TextInputType.text,
            obscureText: false,
            validator: (value) {
              if (value!.isEmpty) return AppString.required;
              return null;
            },
          ),
        ],
        onSave: () {
          context.read<ProfileBloc>().add(ProfileEvent.edit(
                dto: PersonDto(
                  firstName: _firstNameController.text,
                  lastName: _lastNameController.text,
                ),
              ));
        });
  }

  void _showEditPhoneBottomSheet(BuildContext context, value) {
    _showEditBottomSheet(
      mainContext: context,
      title: AppString.phone,
      fields: [
        CustomTextFormField(
          controller: _phoneController,
          hintText: 'Введите номер телефона',
          keyboardType: TextInputType.phone,
          obscureText: false,
          validator: (value) {
            if (value!.isEmpty) return AppString.required;
            return null;
          },
        ),
      ],
      onSave: () {
        if (_phoneController.text != value.person.phone) {
          context.read<ProfileBloc>().add(ProfileEvent.edit(
                dto: PersonDto(phone: _phoneController.text),
              ));
        }
      },
    );
  }

  void _showEditEmailBottomSheet(BuildContext context) {
    _showEditBottomSheet(
      mainContext: context,
      title: AppString.phone,
      fields: [
        CustomTextFormField(
          controller: _emailController,
          hintText: 'Введите почту',
          keyboardType: TextInputType.emailAddress,
          obscureText: false,
          validator: (value) {
            if (value!.isEmpty) return AppString.required;
            return null;
          },
        ),
      ],
      onSave: () {
        context.read<ProfileBloc>().add(ProfileEvent.edit(
              dto: PersonDto(email: _emailController.text),
            ));
      },
    );
  }
}
