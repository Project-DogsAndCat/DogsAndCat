import 'package:dogs_and_cats/core/widgets/rounded_elevated_button.dart';
import 'package:flutter/material.dart';

class TileRole extends StatelessWidget {
  const TileRole({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onPressed,
  });
  final String title;
  final String subtitle;
  final String buttonText;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            const SizedBox(
              height: 5.0,
            ),
            Text(subtitle),
            const SizedBox(
              height: 5.0,
            ),
            RoundedElevatedButton(
              widget: Text(buttonText),
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
