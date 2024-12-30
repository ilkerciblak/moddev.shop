import 'package:flutter/material.dart';
import 'package:mobile_application/common/theme/_theme.dart';

final class AppTheme {
  static ThemeData appDarkTheme = ThemeData(
      textTheme: AppTextStylesDark.darkTextTheme,
      scaffoldBackgroundColor: AppColors.primaryBlack,
      inputDecorationTheme: AppFormTheme().inputDecorationThemeDark,
      // searchBarTheme: AppSearchBarTheme.searchBarTheme,
      searchViewTheme: AppSearchViewTheme.searchViewThemeDark,
      iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(
        iconColor: WidgetStatePropertyAll(Colors.white),
      )),
      datePickerTheme: DatePickerThemeData(
        cancelButtonStyle: ButtonStyle(
          foregroundColor:
              WidgetStatePropertyAll(AppTextStyles.labelMedium.color),
          textStyle: WidgetStatePropertyAll(
            AppTextStyles.labelLarge.copyWith(
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        confirmButtonStyle: ButtonStyle(
          foregroundColor:
              WidgetStatePropertyAll(AppTextStyles.labelLarge.color),
          textStyle: WidgetStatePropertyAll(
            AppTextStyles.labelLarge.copyWith(
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
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
      listTileTheme: ListTileThemeData(
        tileColor: AppColors.primarySilver.withOpacity(0.7),
        minVerticalPadding: 2,
      ));

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
