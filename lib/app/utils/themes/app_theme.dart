import 'package:flutter/material.dart';
import 'package:invest_app/app/utils/themes/app_colors.dart';

class AppTheme {
  static ThemeData get primaryTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(
              AppColors.brownCoffeeColor,
            ),
          ),
        ),
        colorSchemeSeed: AppColors.brownCoffeeColor,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        iconTheme: const IconThemeData(
          color: AppColors.blackColor,
          // size: 24,
        ),
        appBarTheme: const AppBarTheme(
          actionsIconTheme: IconThemeData(color: AppColors.blackColor),
          iconTheme: IconThemeData(color: AppColors.blackColor),
          backgroundColor: AppColors.backgroundColor,
          elevation: 0,
        ),
      );
}
