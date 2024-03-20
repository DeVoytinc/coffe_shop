import 'package:coffe_shop/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

final theme = ThemeData(
  scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
  primaryColor: AppColors.primary,
  cardTheme: const CardTheme(),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      elevation: 0,
      textStyle: const TextStyle(color: Colors.white),
    ),
  ),
  textTheme: const TextTheme(
    titleSmall: TextStyle(
      color: Color.fromARGB(255, 0, 0, 0),
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    bodyLarge: TextStyle(
      color: Colors.black,
      fontSize: 32,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: TextStyle(
      color: Color.fromARGB(255, 0, 0, 0),
      fontSize: 16,
      fontWeight: FontWeight.w500
    ),
    bodySmall: TextStyle(
      color: Color.fromARGB(255, 255, 255, 255),
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
  ),
);
