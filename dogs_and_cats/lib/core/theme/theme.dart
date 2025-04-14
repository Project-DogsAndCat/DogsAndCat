import 'package:dogs_and_cats/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

final textTheme = TextTheme(
  //Для BottomNavigationBar
  titleSmall: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.backGroundColor,
    fontFamily: 'NimbusSanL',
  ),

  //Для заголовок страниц
  titleMedium: TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w900,
    color: AppColors.backGroundColor,
    fontFamily: 'NimbusSanL',
  ),

  //Для всех лэйблов
  labelLarge: TextStyle(
    fontSize: 18,
    height: 0.9,
    fontWeight: FontWeight.w900,
    color: AppColors.backGroundColor,
    fontFamily: 'NimbusSanL',
  ),

  //Для страницы услуг
  titleLarge: TextStyle(
    fontSize: 50,
    height: 0.9,
    fontWeight: FontWeight.w500,
    color: AppColors.backGroundColor,
    fontFamily: 'NimbusSanL',
  ),
  labelMedium: TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w900,
    color: AppColors.backGroundColor,
    fontFamily: 'NimbusSanL',
  ),
  bodyMedium: TextStyle(
    height: 1,
    fontSize: 14,
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
