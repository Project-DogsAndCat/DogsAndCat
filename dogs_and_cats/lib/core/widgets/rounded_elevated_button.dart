import 'package:flutter/material.dart';

import '../utils/app_pallet.dart';

class RoundedElevatedButton extends StatelessWidget {
  const RoundedElevatedButton(
      {super.key,
      required this.buttonText,
      this.onPressed,
      this.color = AppPallet.appColor});
  final String buttonText;
  final Function()? onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(color),
        elevation: const WidgetStatePropertyAll(0),
        shape: const WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),
        fixedSize: WidgetStatePropertyAll(
          Size(
            MediaQuery.sizeOf(context).width,
            45,
          ),
        ),
      ),
      child: Text(
        buttonText,
        style: const TextStyle(
            color: AppPallet.whiteColor,
            fontWeight: FontWeight.w400,
            fontSize: 16),
      ),
    );
  }
}
