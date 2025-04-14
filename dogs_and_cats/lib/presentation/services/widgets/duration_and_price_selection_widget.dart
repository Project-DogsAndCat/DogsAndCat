import 'package:dogs_and_cats/core/theme/theme.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class DurationAndPriceSelectionWidget extends StatefulWidget {
  const DurationAndPriceSelectionWidget({
    super.key,
    required this.index,
    required this.duration,
    required this.price,
    required this.selected,
    required this.onSelected,
  });
  final int index;
  final String duration;
  final double price;
  final bool selected;
  final Function(String, double) onSelected;

  @override
  State<DurationAndPriceSelectionWidget> createState() =>
      _DurationAndPriceSelectionWidgetState();
}

class _DurationAndPriceSelectionWidgetState
    extends State<DurationAndPriceSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Column(
        children: [
          Text(
            widget.duration,
            style: textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 7,
          ),
          Text(
            '${widget.price.toStringAsFixed(0)} руб',
            style: textTheme.bodyMedium,
          )
        ],
      ),
      selected: widget.selected,
      onSelected: (bool selected) {
        widget.onSelected(widget.duration, widget.price);
      },
      showCheckmark: false,
      selectedColor: AppColors.primaryColor,
    );
  }
}
