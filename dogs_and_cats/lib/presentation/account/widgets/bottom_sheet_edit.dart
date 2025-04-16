import 'package:dogs_and_cats/core/theme/app_colors.dart';
import 'package:dogs_and_cats/core/theme/theme.dart';
import 'package:dogs_and_cats/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/rounded_elevated_button.dart';

class BottomSheetEdit extends StatefulWidget {
  const BottomSheetEdit(
      {super.key,
      required this.title,
      required this.onSave,
      required this.fields});
  final String title;
  final VoidCallback onSave;
  final List<Widget> fields;

  @override
  State<BottomSheetEdit> createState() => _BottomSheetEditState();
}

class _BottomSheetEditState extends State<BottomSheetEdit> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 5,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[400],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(widget.title, style: textTheme.labelLarge),
            const SizedBox(
              height: 20.0,
            ),
            ...widget.fields,
            const SizedBox(height: 15.0),
            RoundedElevatedButton(
              height: 50,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  widget.onSave();
                  Navigator.pop(context);
                }
              },
              widget: Text(
                AppString.update,
                style:
                    textTheme.bodyMedium!.copyWith(color: AppColors.whiteColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
