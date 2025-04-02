import 'package:dogs_and_cats/domain/models/person.dart';
import 'package:dogs_and_cats/presentation/account/blocs/profile_bloc/profile_bloc.dart';
import 'package:dogs_and_cats/presentation/account/widgets/bottom_sheet_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_strings.dart';
import '../../../core/widgets/custom_text_form_field.dart';

class NameEdit extends StatefulWidget {
  const NameEdit({super.key, required this.person});
  final Person person;

  @override
  State<NameEdit> createState() => _NameEditState();
}

class _NameEditState extends State<NameEdit> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _firstNameController = TextEditingController(text: widget.person.firstName);
    _lastNameController = TextEditingController(text: widget.person.lastName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetEdit(
      title: AppString.firstAndLastName,
      fields: [
        CustomTextFormField(
          controller: _firstNameController,
          hintText: AppString.firstName,
          keyboardType: TextInputType.text,
          validator: (value) {
            if (value!.isEmpty) {
              return AppString.required;
            }
            return null;
          },
        ),
        const SizedBox(height: 15.0),
        CustomTextFormField(
          controller: _lastNameController,
          hintText: AppString.lastName,
          keyboardType: TextInputType.text,
          validator: (value) {
            if (value!.isEmpty) {
              return AppString.required;
            }
            return null;
          },
        ),
      ],
      onSave: () {
        context.read<ProfileBloc>().add(
              ProfileEvent.edit(
                person: Person(
                  firstName: _firstNameController.text,
                  lastName: _lastNameController.text,
                ),
              ),
            );
      },
    );
  }
}
