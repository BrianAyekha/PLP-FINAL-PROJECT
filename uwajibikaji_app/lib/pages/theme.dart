import 'package:flutter/material.dart';

class AppColors {
  static const primaryColor = Color(0xFF2D6A4F); // Rich green for primary elements
  static const accentColor = Color(0xFFF4A261); // Warm accent color
  static const backgroundColor = Color(0xFFF1FAEE); // Light background color
  static const textColor = Color(0xFF1D3557); // Deep blue for text
  static const errorColor = Color(0xFFE63946); // Red for errors
}

ThemeData appTheme = ThemeData(
  primaryColor: AppColors.primaryColor,
  scaffoldBackgroundColor: AppColors.backgroundColor,
  textTheme: TextTheme(
    titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textColor),
    bodyMedium: TextStyle(color: AppColors.textColor),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide.none,
    ),
  ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.accentColor),
);
