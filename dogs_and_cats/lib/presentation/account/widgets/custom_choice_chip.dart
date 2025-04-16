import 'package:dogs_and_cats/core/theme/app_colors.dart';
import 'package:dogs_and_cats/core/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomChoiceChip extends StatefulWidget {
  const CustomChoiceChip({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onSelected,
  });
  final String title;
  final bool isSelected;
  final Function(bool) onSelected;

  @override
  State<CustomChoiceChip> createState() => _CustomChoiceChipState();
}

class _CustomChoiceChipState extends State<CustomChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ChoiceChip(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          label: SizedBox(
            width: double.infinity,
            child: Center(
              child: Text(
                widget.title,
                style: textTheme.bodyMedium,
              ),
            ),
          ),
          showCheckmark: false,
          selectedColor: AppColors.primaryColor,
          backgroundColor: AppColors.buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
            side: const BorderSide(color: Colors.transparent),
          ),
          selected: widget.isSelected,
          onSelected: widget.onSelected),
    );
  }
}
