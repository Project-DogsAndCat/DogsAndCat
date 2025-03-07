import 'package:flutter/material.dart';

class BottomSheetInfo extends StatelessWidget {
  const BottomSheetInfo({super.key, required this.widgets});
  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widgets,
        ),
      ),
    );
  }
}
