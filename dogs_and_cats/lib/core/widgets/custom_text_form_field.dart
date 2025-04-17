import 'package:dogs_and_cats/core/theme/app_colors.dart';
import 'package:dogs_and_cats/core/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.suffixIcon,
    this.color,
    this.onChanged,
    this.keyboardType,
    this.obscureText = false,
    this.readOnly = false,
    this.maxLines = 1,
    this.colorText,
  });
  final TextEditingController controller;
  final String? Function(String? val)? validator;
  final TextInputType? keyboardType;
  final String hintText;
  final Widget? suffixIcon;
  final Color? color;
  final bool obscureText;
  final bool readOnly;
  final int? maxLines;
  final ValueChanged<String>? onChanged;
  final TextStyle? colorText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      readOnly: readOnly,
      maxLines: maxLines,
      onChanged: onChanged,
      // inputFormatters: <TextInputFormatter>[
      //   FilteringTextInputFormatter.digitsOnly
      // ],
      style: colorText ?? textTheme.bodyMedium,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: colorText ?? textTheme.bodyMedium,
        errorStyle: TextStyle(
          fontSize: 11,
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.errorColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}
