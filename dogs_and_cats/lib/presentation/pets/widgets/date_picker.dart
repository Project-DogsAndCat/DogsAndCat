import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';

class MyDatePicker extends StatelessWidget {
  const MyDatePicker({
    super.key,
    required TextEditingController ageController,
  }) : _ageController = ageController;

  final TextEditingController _ageController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        DateTime now = DateTime.now();
        final dateBhd = await DatePicker.showSimpleDatePicker(
          context,
          firstDate: DateTime(now.year - 30),
          lastDate: now,
          dateFormat: "dd-MMMM-yyyy",
          locale: DateTimePickerLocale.ru,
          looping: true,
        );

        if (dateBhd != null) {
          _ageController.text = _calculatingAge(dateBhd);
        }
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(25.0)),
      ),
    );
  }
}

String _calculatingAge(DateTime dateBhd) {
  DateTime today = DateTime.now();
  final year = _formatingYear(today.year - dateBhd.year);
  int mth = today.month - dateBhd.month;
  if (mth < 0) mth = 12 + mth;
  return '$year $mth мес.';
}

String _formatingYear(int year) {
  if (year % 10 == 1 && year != 11) return '$year год';
  if (year % 10 > 1 && year % 10 < 5) {
    return '$year года';
  } else {
    return '$year лет';
  }
}
