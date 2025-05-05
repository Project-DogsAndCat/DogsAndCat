import 'package:dogs_and_cats/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch(
      {super.key, required this.title, required this.value, this.onChanged});

  final String title;
  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
            ),
            Switch(
              value: value,
              onChanged: onChanged,
              activeColor: AppColors.whiteColor,
              activeTrackColor: AppColors.primaryColor,
              inactiveTrackColor: AppColors.bottomNavigationBarIconColor,
              inactiveThumbColor: AppColors.whiteColor,
              trackOutlineColor: WidgetStateProperty.resolveWith(
                (final Set<WidgetState> states) {
                  if (states.contains(WidgetState.selected)) {
                    return null;
                  }
                  return AppColors.bottomNavigationBarIconColor;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
