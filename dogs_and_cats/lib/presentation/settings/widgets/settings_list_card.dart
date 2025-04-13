import 'package:flutter/material.dart';

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
          Switch(value: value, onChanged: onChanged),
        ],
      ),
    );
  }
}
