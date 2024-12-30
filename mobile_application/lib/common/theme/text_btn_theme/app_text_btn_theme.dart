import 'package:flutter/material.dart';
import 'package:mobile_application/common/theme/typography/_typography.dart';

final class AppTextBtnTheme {
  static TextButtonThemeData textButtonThemeDataDark = TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor:
          WidgetStatePropertyAll(AppTextStylesDark.labelMedium.color),
      textStyle: WidgetStatePropertyAll(
        AppTextStylesDark.labelMedium.copyWith(
          decoration: TextDecoration.underline,
        ),
      ),
    ),
  );
}
