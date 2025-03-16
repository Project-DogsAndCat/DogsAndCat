import 'package:flutter/material.dart';

import '../../../core/widgets/rounded_elevated_button.dart';

class BottomSheetEditPage extends StatefulWidget {
  const BottomSheetEditPage(
      {super.key,
      required this.title,
      required this.onSave,
      required this.fields});
  final String title;
  final VoidCallback onSave;
  final List<Widget> fields;

  @override
  State<BottomSheetEditPage> createState() => _BottomSheetEditPageState();
}

class _BottomSheetEditPageState extends State<BottomSheetEditPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.title, style: Theme.of(context).textTheme.titleMedium),
            ...widget.fields,
            const SizedBox(height: 10.0),
            RoundedElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  widget.onSave();
                  Navigator.pop(context);
                }
              },
              widget: const Text('Изменить'),
            ),
          ],
        ),
      ),
    );
  }
}
