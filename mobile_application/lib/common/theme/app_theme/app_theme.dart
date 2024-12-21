import 'package:flutter/material.dart';
import 'package:mobile_application/common/theme/_theme.dart';

final class AppTheme {
  static ThemeData appDarkTheme = ThemeData(
    textTheme: AppTextStylesDark.darkTextTheme,
    scaffoldBackgroundColor: AppColors.primaryBlack,
    inputDecorationTheme: AppFormTheme().inputDecorationThemeDark,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor:
            WidgetStatePropertyAll(AppTextStylesDark.labelMedium.color),
        textStyle: WidgetStatePropertyAll(
          AppTextStylesDark.labelMedium.copyWith(
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    ),
  );

  static ThemeData appLightTheme = ThemeData(
      textTheme: AppTextStyles.textTheme,
      scaffoldBackgroundColor: AppColors.secondaryWhite,
      inputDecorationTheme: AppFormTheme().inputDecorationThemeLight,
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor:
              WidgetStatePropertyAll(AppTextStyles.labelMedium.color),
          textStyle: WidgetStatePropertyAll(
            AppTextStyles.labelMedium.copyWith(
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ));
}