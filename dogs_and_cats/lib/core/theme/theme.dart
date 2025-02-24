import 'package:dogs_and_cats/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  textTheme: textTheme,
  primaryColor: AppColors.appColor,
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.grey,
  dividerTheme: DividerThemeData(
    color: Colors.grey.withValues(alpha: 0.1),
  ),
  colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.appColor, brightness: Brightness.light),
);

final darkTheme = ThemeData(
  textTheme: textTheme,
  primaryColor: AppColors.appColor,
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.black,
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.appColor,
    brightness: Brightness.dark,
  ),
);

final textTheme = TextTheme(
  titleMedium: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  ),
  headlineLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
);
