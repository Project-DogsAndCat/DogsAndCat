import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:date_picker_timeline/gestures/tap.dart';
import 'package:dogs_and_cats/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DatePickerWidget extends StatelessWidget {
  const DatePickerWidget(
      {super.key,
      required this.height,
      required this.width,
      required this.daysCount,
      required this.onDateChange});
  final double height;
  final double width;
  final int daysCount;
  final DateChangeListener onDateChange;

  @override
  Widget build(BuildContext context) {
    return DatePicker(
      DateTime.now(),
      initialSelectedDate: DateTime.now(),
      height: height,
      width: width,
      daysCount: daysCount,
      locale: "ru_RU",
      selectionColor: AppColors.primaryColor,
      selectedTextColor: AppColors.whiteColor,
      dateTextStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
      dayTextStyle: TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
      monthTextStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
      onDateChange: onDateChange,
    );
  }
}
