import 'package:flutter/material.dart';
import 'package:mobile_application/common/theme/_theme.dart';

final class AppTheme {
  static ThemeData appDarkTheme = ThemeData(
    textTheme: AppTextStylesDark.darkTextTheme,
    scaffoldBackgroundColor: AppColors.primaryBlack,
    inputDecorationTheme: AppFormTheme().inputDecorationThemeDark,
    searchViewTheme: AppSearchViewTheme.searchViewThemeDark,
    iconButtonTheme: AppIconBtnTheme.appIconBtnThemeDark,
    datePickerTheme: AppDatePickerTheme.datePickerThemeDataDark,
    textButtonTheme: AppTextBtnTheme.textButtonThemeDataDark,
    listTileTheme: AppListTileTheme.listTileThemeDataDark,
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
