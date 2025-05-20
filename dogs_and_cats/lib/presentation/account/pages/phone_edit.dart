import 'package:dogs_and_cats/core/utils/app_strings.dart';
import 'package:dogs_and_cats/core/widgets/custom_text_form_field.dart';
import 'package:dogs_and_cats/domain/models/person.dart';
import 'package:dogs_and_cats/presentation/account/blocs/profile_bloc/profile_bloc.dart';
import 'package:dogs_and_cats/presentation/account/widgets/bottom_sheet_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/validation_rules.dart';

class PhoneEdit extends StatefulWidget {
  const PhoneEdit({super.key, required this.person});
  final Person person;

  @override
  State<PhoneEdit> createState() => _PhoneEditState();
}

class _PhoneEditState extends State<PhoneEdit> {
  late TextEditingController _phoneController;

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _phoneController = TextEditingController(text: widget.person.phone);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetEdit(
      title: AppString.phone,
      fields: [
        CustomTextFormField(
          controller: _phoneController,
          hintText: AppString.phone,
          keyboardType: TextInputType.text,
          validator: (value) {
            if (isValidatingEmail()) {
              return AppString.providedValidPhone;
            }
            return null;
          },
        ),
      ],
      onSave: () {
        context.read<ProfileBloc>().add(
              ProfileEvent.edit(
                  originalPerson: widget.person,
                  updatePerson: widget.person.copyWith(
                    phone: _phoneController.text,
                  )),
            );
        Navigator.pop(context);
      },
    );
  }

  bool isValidatingEmail() {
    if (_phoneController.text.isEmpty) return false;
    if (ValidationRules.phoneValidation.hasMatch(_phoneController.text)) {
      return false;
    }
    return true;
  }
}
