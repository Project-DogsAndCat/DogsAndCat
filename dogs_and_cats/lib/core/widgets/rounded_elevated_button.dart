import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/auth/bloc/auth_bloc.dart';
import '../theme/app_colors.dart';

class RoundedElevatedButton extends StatelessWidget {
  const RoundedElevatedButton(
      {super.key,
      this.onPressed,
      this.color = AppColors.primaryColor,
      required this.widget});
  final Function()? onPressed;
  final Color color;
  final Widget widget;

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
              Radius.circular(25.0),
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
      child: widget,
    );
  }
}
