import 'package:flutter/material.dart';
import 'package:mobile_application/common/theme/color/app_colors.dart';
import 'package:mobile_application/common/theme/typography/_typography.dart';
import 'package:mobile_application/common/extension/_extension.dart';

final class AppSearchViewTheme {
  static SearchViewThemeData searchViewThemeDark = SearchViewThemeData(
    backgroundColor: AppColors.primaryBlack,
    dividerColor: AppColors.secondaryWhite,
    headerTextStyle: AppTextStylesDark.bodyMedium,
    headerHintStyle: AppTextStylesDark.bodyMedium.withOpacity(0.7),
    // surfaceTintColor: Colors.white,
  );

  static SearchViewThemeData searchViewThemeLight = SearchViewThemeData(
    backgroundColor: AppColors.secondaryWhite,
    dividerColor: AppColors.primaryBlack,
    headerTextStyle: AppTextStyles.bodyMedium,
    headerHintStyle: AppTextStyles.bodyMedium.withOpacity(0.7),
  );
}
