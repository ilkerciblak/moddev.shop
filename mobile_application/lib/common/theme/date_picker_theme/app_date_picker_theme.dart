import 'package:flutter/material.dart';
import 'package:mobile_application/common/theme/typography/_typography.dart';

final class AppDatePickerTheme {
  static DatePickerThemeData datePickerThemeDataDark = DatePickerThemeData(
    cancelButtonStyle: ButtonStyle(
      foregroundColor: WidgetStatePropertyAll(AppTextStyles.labelMedium.color),
      textStyle: WidgetStatePropertyAll(
        AppTextStyles.labelLarge.copyWith(
          decoration: TextDecoration.underline,
        ),
      ),
    ),
    confirmButtonStyle: ButtonStyle(
      foregroundColor: WidgetStatePropertyAll(AppTextStyles.labelLarge.color),
      textStyle: WidgetStatePropertyAll(
        AppTextStyles.labelLarge.copyWith(
          decoration: TextDecoration.underline,
        ),
      ),
    ),
  );
}
