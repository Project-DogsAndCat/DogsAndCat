import 'package:dogs_and_cats/core/widgets/rounded_elevated_button.dart';
import 'package:flutter/material.dart';

class FailurePage extends StatelessWidget {
  const FailurePage({
    super.key,
    required this.message,
    required this.onPressed,
  });
  final String message;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ListTile(
          title: Text('Ошибка'),
          subtitle: Text(message),
        ),
        RoundedElevatedButton(
          widget: Text('Попробовать снова'),
          onPressed: onPressed,
        ),
      ],
    );
  }
}
