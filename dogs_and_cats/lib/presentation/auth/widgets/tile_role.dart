import 'package:dogs_and_cats/core/theme/app_colors.dart';
import 'package:dogs_and_cats/core/widgets/rounded_elevated_button.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/theme.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.buttonColorDarkTheme,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: textTheme.displayMedium!
                    .copyWith(color: AppColors.whiteColor),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                subtitle,
                style:
                    textTheme.bodyMedium!.copyWith(color: AppColors.whiteColor),
              ),
              const SizedBox(
                height: 25.0,
              ),
              RoundedElevatedButton(
                widget: Text(
                  buttonText,
                  style: textTheme.bodyMedium!
                      .copyWith(color: AppColors.whiteColor),
                ),
                onPressed: onPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
