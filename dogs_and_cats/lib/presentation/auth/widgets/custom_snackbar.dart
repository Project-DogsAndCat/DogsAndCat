import 'package:dogs_and_cats/core/utils/app_pallet.dart';
import 'package:flutter/material.dart';

class CustomSnackBar {
  static void showSuccess(BuildContext context, String message) {
    _showSnackBar(context, message, AppPallet.snackBarGreen);
  }

  static void showInfo(BuildContext context, String message) {
    _showSnackBar(context, message, AppPallet.snackBarBlue);
  }

  static void showError(BuildContext context, String message) {
    _showSnackBar(context, message, AppPallet.snackBarRed);
  }

  static void _showSnackBar(BuildContext context, String message, Color color) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              message,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: AppPallet.whiteColor),
            ),
            backgroundColor: color,
          ),
        );
      },
    );
  }
}
