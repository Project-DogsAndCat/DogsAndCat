import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class RoundedElevatedButton extends StatelessWidget {
  const RoundedElevatedButton(
      {super.key,
      this.onPressed,
      this.color = AppColors.primaryColor,
      this.height = 45,
      required this.widget});
  final Function()? onPressed;
  final Color color;
  final Widget widget;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
        backgroundColor: WidgetStatePropertyAll(color),
        elevation: const WidgetStatePropertyAll(0),
        shape: const WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25.0),
            ),
          ),
        ),
        fixedSize: WidgetStatePropertyAll(
          Size(
            MediaQuery.sizeOf(context).width,
            height,
          ),
        ),
      ),
      child: widget,
    );
  }
}
