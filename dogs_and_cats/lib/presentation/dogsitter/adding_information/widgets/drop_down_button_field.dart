import 'package:flutter/material.dart';

import '../../../../core/utils/positions.dart';

class PositionDropDownButtonField extends StatefulWidget {
  const PositionDropDownButtonField(
      {super.key, required this.selectedValue, required this.onChanged});
  final String selectedValue;
  final ValueChanged<String?> onChanged;

  @override
  State<PositionDropDownButtonField> createState() =>
      _PositionDropDownButtonFieldState();
}

class _PositionDropDownButtonFieldState
    extends State<PositionDropDownButtonField> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        filled: true,
        fillColor: Colors.blueAccent,
      ),
      dropdownColor: Colors.blueAccent,
      value: widget.selectedValue,
      onChanged: widget.onChanged,
      items: dropdownItems,
    );
  }
}
