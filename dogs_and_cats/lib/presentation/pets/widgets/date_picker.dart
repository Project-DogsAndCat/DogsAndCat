import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';

import '../../../core/utils/calculate_age.dart';

class MyDatePicker extends StatelessWidget {
  const MyDatePicker({
    super.key,
    required TextEditingController ageController,
    required this.changeDateBhD,
  }) : _ageController = ageController;

  final TextEditingController _ageController;
  final Function(DateTime date) changeDateBhD;

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
          changeDateBhD(dateBhd);
          _ageController.text = calculatingAge(dateBhd);
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
