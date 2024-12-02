import 'package:flutter/material.dart';
import 'package:orders_insights/app/core/values/app_colors.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.bgColor,
    fontFamily: "Cairo",
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0.0,
    ),
    indicatorColor: AppColors.primaryColor,
  );
}
