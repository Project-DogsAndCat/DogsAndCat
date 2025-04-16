import 'package:dogs_and_cats/core/theme/app_colors.dart';
import 'package:dogs_and_cats/core/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomProfileButton extends StatelessWidget {
  const CustomProfileButton(
      {super.key,
      required this.onPressed,
      required this.mainInfoTitle,
      this.otherInfoTitle,
      required this.icon});
  final VoidCallback onPressed;
  final String mainInfoTitle;
  final String? otherInfoTitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)))),
        backgroundColor: WidgetStatePropertyAll(AppColors.buttonColor),
        elevation: const WidgetStatePropertyAll(0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mainInfoTitle,
                  style: textTheme.bodyMedium,
                ),
                otherInfoTitle != null
                    ? Text(
                        otherInfoTitle!,
                        style: textTheme.bodyMedium,
                      )
                    : const SizedBox.shrink()
              ],
            ),
            Icon(
              icon,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
