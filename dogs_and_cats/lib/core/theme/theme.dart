import 'package:dogs_and_cats/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  textTheme: textTheme.copyWith(bodyMedium: TextStyle(color: Colors.black)),
  primaryColor: AppColors.appColor,
  useMaterial3: true,
  scaffoldBackgroundColor: Color(0xFFF8FAEC),
  colorScheme: ColorScheme.light(surface: Color(0xFFF8FAEC)),
);

final darkTheme = ThemeData(
  textTheme: textTheme.copyWith(bodyMedium: TextStyle(color: Colors.white)),
  primaryColor: AppColors.appColor,
  useMaterial3: true,
  scaffoldBackgroundColor: Color(0xFF232323),
  colorScheme: ColorScheme.dark(surface: Color(0xFF232323)),
);

final textTheme = TextTheme(
  titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
  headlineLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
);
