import 'package:dogs_and_cats/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

final textTheme = TextTheme(
  // Для заголовок на странице ChooseRole
  displayMedium: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w900,
    fontFamily: 'NimbusSanL',
  ),

  // Для BottomNavigationBar
  titleSmall: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    fontFamily: 'NimbusSanL',
  ),

  // Для заголовок страниц
  titleMedium: TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w900,
    fontFamily: 'NimbusSanL',
  ),

  // Для всех лэйблов
  labelLarge: TextStyle(
    fontSize: 18,
    height: 0.9,
    fontWeight: FontWeight.w900,
    fontFamily: 'NimbusSanL',
  ),

  titleLarge: TextStyle(
    fontSize: 50,
    height: 0.9,
    fontWeight: FontWeight.w500,
    fontFamily: 'NimbusSanL',
  ),
  labelMedium: TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w900,
    fontFamily: 'NimbusSanL',
  ),
  bodyMedium: TextStyle(
    height: 1,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: 'NimbusSanL',
  ),
  bodyLarge: TextStyle(
    height: 1,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    fontFamily: 'NimbusSanL',
  ),
);

final lightTheme = ThemeData(
  textTheme: ThemeData.light()
      .textTheme
      .merge(textTheme)
      .copyWith(bodyLarge: TextStyle(color: Colors.black)),
  primaryColor: AppColors.appColor,
  useMaterial3: true,
  scaffoldBackgroundColor: Color(0xFFF8FAEC),
  colorScheme: ColorScheme.light(
    surface: AppColors.buttonColor,
    primaryContainer: AppColors.buttonColor,
  ),
  appBarTheme: AppBarTheme(backgroundColor: Color(0xFFF8FAEC)),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.backGroundColor,
    ),
  ),
  iconTheme: IconThemeData(color: AppColors.backGroundColor),
  bottomSheetTheme: BottomSheetThemeData(backgroundColor: Color(0xFFF8FAEC)),
  progressIndicatorTheme:
      ProgressIndicatorThemeData(color: AppColors.backGroundColor),
);

final darkTheme = ThemeData(
  textTheme: ThemeData.dark()
      .textTheme
      .merge(textTheme)
      .copyWith(bodyMedium: TextStyle(color: Colors.white)),
  primaryColor: AppColors.appColor,
  useMaterial3: true,
  scaffoldBackgroundColor: Color(0xFF232323),
  colorScheme: ColorScheme.dark(
    surface: Color(0xFF37383D),
    primaryContainer: Color(0xFF37383D),
  ),
  appBarTheme: AppBarTheme(backgroundColor: Color(0xFF232323)),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.whiteColor,
    ),
  ),
  iconTheme: IconThemeData(color: AppColors.whiteColor),
  bottomSheetTheme: BottomSheetThemeData(backgroundColor: Color(0xFF232323)),
  progressIndicatorTheme:
      ProgressIndicatorThemeData(color: AppColors.whiteColor),
);
