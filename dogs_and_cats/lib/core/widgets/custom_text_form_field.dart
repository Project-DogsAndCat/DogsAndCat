import 'package:dogs_and_cats/core/utils/app_pallet.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.controller,
      required this.validator,
      required this.keyboardType,
      required this.obscureText,
      required this.hintText,
      this.suffix});
  final TextEditingController controller;
  final String? Function(String? val) validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final String hintText;
  final Widget? suffix;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        suffix: suffix,
        hintText: hintText,
        hintStyle: TextStyle(fontWeight: FontWeight.w400),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppPallet.borderColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppPallet.borderColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppPallet.appColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppPallet.errorColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
