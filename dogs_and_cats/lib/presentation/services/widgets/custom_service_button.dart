import 'package:flutter/material.dart';

class CustomServiceButton extends StatelessWidget {
  const CustomServiceButton(
      {super.key, this.onPressed, this.height = 45, required this.widget});
  final Function()? onPressed;
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
