import 'package:dogs_and_cats/presentation/account/blocs/profile_bloc.dart';
import 'package:dogs_and_cats/presentation/account/widgets/custom_profile_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_strings.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../widgets/bottom_sheet_info.dart';
import '../widgets/profile_list_card.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
              return state.map(
                loading: (_) => Center(
                  child: CircularProgressIndicator(),
                ),
                loaded: (state) {
                  _firstNameController.text = state.person.firstName;
                  _lastNameController.text = state.person.lastName;

                  return CustomProfileButton(
                    onPressed: () {
                      _showProfileBottomSheet(context, state);
                    },
                    mainInfoTitle: state.person.firstName,
                    otherInfoTitle: state.person.lastName,
                    icon: Icons.add,
                  );
                },
                failure: (state) => Text(state.message),
              );
            }),
          ],
        ),
      ),
    );
  }

  void _showProfileBottomSheet(BuildContext context, state) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return BottomSheetInfo(
          widgets: [
            GestureDetector(
              child: ProfileListCard(
                  mainInfoTitle:
                      '${state.person.firstName} ${state.person.lastName}',
                  icon: Icons.add_ic_call),
              onTap: () {
                Navigator.pop(context);
                _showEditBottomSheet(context);
              },
            ),
            GestureDetector(
              child: ProfileListCard(
                  mainInfoTitle: state.person.phone ?? 'Укажите номер телефона',
                  icon: Icons.add_ic_call),
            ),
            GestureDetector(
              child: ProfileListCard(
                  mainInfoTitle: state.person.email, icon: Icons.add_ic_call),
            ),
          ],
        );
      },
    );
  }

  void _showEditBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return BottomSheetInfo(
          widgets: [
            const Text(AppString.firstAndLastName),
            CustomTextFormField(
              controller: _firstNameController,
              hintText: 'Введите Имя',
              keyboardType: TextInputType.text,
              obscureText: false,
              validator: (val) {
                if (val!.isEmpty) {
                  return AppString.required;
                }
                return null;
              },
            ),
            CustomTextFormField(
              controller: _lastNameController,
              hintText: 'Введите фамилию',
              keyboardType: TextInputType.text,
              obscureText: false,
              validator: (val) {
                if (val!.isEmpty) {
                  return AppString.required;
                }
                return null;
              },
            ),
          ],
        );
      },
    );
  }
}
