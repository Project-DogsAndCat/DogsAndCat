import 'package:dogs_and_cats/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

final textTheme = TextTheme(
  titleMedium: TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w900,
    color: AppColors.backGroundColor,
    fontFamily: 'NimbusSanL',
  ),
  headlineLarge: TextStyle(
    height: 1,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.backGroundColor,
    fontFamily: 'NimbusSanL',
  ),
  titleLarge: TextStyle(
    fontSize: 40,
    height: 0.9,
    fontWeight: FontWeight.w500,
    color: AppColors.backGroundColor,
    fontFamily: 'NimbusSanL',
  ),
);

final lightTheme = ThemeData(
  textTheme: ThemeData.light()
      .textTheme
      .merge(textTheme)
      .copyWith(bodyMedium: TextStyle(color: Colors.black)),
  primaryColor: AppColors.appColor,
  useMaterial3: true,
  scaffoldBackgroundColor: Color(0xFFF8FAEC),
  colorScheme: ColorScheme.light(surface: Color(0xFFF8FAEC)),
);

final darkTheme = ThemeData(
  textTheme: ThemeData.dark()
      .textTheme
      .merge(textTheme)
      .copyWith(bodyMedium: TextStyle(color: Colors.white)),
  primaryColor: AppColors.appColor,
  useMaterial3: true,
  scaffoldBackgroundColor: Color(0xFF232323),
  colorScheme: ColorScheme.dark(surface: Color(0xFF232323)),
);
