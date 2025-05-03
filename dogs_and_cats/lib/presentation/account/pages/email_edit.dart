import 'package:dogs_and_cats/core/utils/app_strings.dart';
import 'package:dogs_and_cats/core/widgets/custom_text_form_field.dart';
import 'package:dogs_and_cats/domain/models/person.dart';
import 'package:dogs_and_cats/presentation/account/blocs/profile_bloc/profile_bloc.dart';
import 'package:dogs_and_cats/presentation/account/widgets/bottom_sheet_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/validation_rules.dart';

class EmailEdit extends StatefulWidget {
  const EmailEdit({super.key, required this.person});

  final Person person;

  @override
  State<EmailEdit> createState() => _EmailEditState();
}

class _EmailEditState extends State<EmailEdit> {
  late TextEditingController _emailController;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _emailController = TextEditingController(text: widget.person.email);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  BottomSheetEdit(
        title: AppString.email,
        fields: [
          CustomTextFormField(
            controller: _emailController,
            hintText: AppString.email,
            keyboardType: TextInputType.text,
            validator: (value) {
              if (isValidatingEmail()) {
                return AppString.providedValidEmail;
              }
              return null;
            },
          )
        ],
        onSave: () {
          context
              .read<ProfileBloc>()
              .add(ProfileEvent.editEmail(email: _emailController.text));
        },
    );
  }

  bool isValidatingEmail() {
    if (_emailController.text.isEmpty) return false;
    if (ValidationRules.emailValidation.hasMatch(_emailController.text)) {
      return false;
    }
    return true;
  }
}
