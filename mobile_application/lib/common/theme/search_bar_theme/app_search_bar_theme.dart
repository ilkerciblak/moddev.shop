import 'package:flutter/material.dart';
import 'package:mobile_application/common/extension/_extension.dart';
import 'package:mobile_application/common/theme/color/app_colors.dart';
import 'package:mobile_application/common/theme/typography/_typography.dart';

@immutable
final class AppSearchBarTheme {
  static SearchViewThemeData searchViewThemeDataDark = SearchViewThemeData(
    backgroundColor: AppColors.primaryBlack,
    dividerColor: AppColors.secondaryWhite,
    headerTextStyle: AppTextStylesDark.bodyMedium,
    headerHintStyle: AppTextStylesDark.bodyMedium,
  );

  static SearchBarThemeData searchBarTheme = SearchBarThemeData(
    textStyle: WidgetStatePropertyAll(AppTextStylesDark.bodyMedium),
    hintStyle: WidgetStatePropertyAll(
      AppTextStylesDark.bodyMedium.withOpacity(0.7),
    ),
  );
}
