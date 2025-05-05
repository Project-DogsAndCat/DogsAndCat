import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class SettingsListCard extends StatelessWidget {
  const SettingsListCard(
      {super.key, required this.title, required this.value, this.onChanged});

  final String title;
  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
            inactiveTrackColor: AppColors.backGroundColor,
            inactiveThumbColor: AppColors.whiteColor,
            trackOutlineColor: WidgetStateProperty.resolveWith(
              (final Set<WidgetState> states) {
                if (states.contains(WidgetState.selected)) {
                  return null;
                }
                return AppColors.backGroundColor;
              },
            ),
          ),
        ],
      ),
    );
  }
}
