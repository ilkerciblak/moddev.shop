import 'package:flutter/material.dart';
import 'package:mobile_application/common/theme/color/app_colors.dart';

class AppTextStylesDark {
  static const String _fontFamily = 'Merriweather';

  static TextStyle get displayLarge => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 48.0,
        fontWeight: FontWeight.bold,
        color: AppColors.secondaryWhite,
      );

  static TextStyle get displayMedium => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 38.0,
        fontWeight: FontWeight.bold,
        color: AppColors.secondaryWhite,
      );

  static TextStyle get displaySmall => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: AppColors.secondaryWhite,
      );

  static TextStyle get headlineLarge => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
        color: AppColors.secondaryWhite,
      );

  static TextStyle get headlineMedium => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 24.0,
        fontWeight: FontWeight.w600,
        color: AppColors.secondaryWhite,
      );

  static TextStyle get headlineSmall => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
        color: AppColors.secondaryWhite,
      );

  static TextStyle get titleLarge => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: AppColors.secondaryWhite,
      );

  static TextStyle get titleMedium => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: AppColors.secondaryWhite,
      );

  static TextStyle get titleSmall => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12.0,
        fontWeight: FontWeight.w500,
        color: AppColors.secondaryWhite,
      );

  static TextStyle get bodyLarge => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        color: AppColors.secondaryWhite,
      );

  static TextStyle get bodyMedium => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: AppColors.secondaryWhite,
      );

  static TextStyle get bodySmall => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 10.0,
        fontWeight: FontWeight.normal,
        color: AppColors.secondaryWhite,
      );

  static TextStyle get labelLarge => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12.0,
        fontWeight: FontWeight.w600,
        color: AppColors.secondaryWhite,
      );

  static TextStyle get labelMedium => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 10.0,
        fontWeight: FontWeight.w500,
        color: AppColors.secondaryWhite,
      );

  static TextStyle get labelSmall => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 8.0,
        fontWeight: FontWeight.w400,
        color: AppColors.secondaryWhite,
      );

  static TextTheme get darkTextTheme => TextTheme(
        bodyLarge: AppTextStylesDark.bodyLarge,
        bodyMedium: AppTextStylesDark.bodyMedium,
        bodySmall: AppTextStylesDark.bodySmall,
        displayLarge: AppTextStylesDark.displayLarge,
        displayMedium: AppTextStylesDark.displayMedium,
        displaySmall: AppTextStylesDark.displaySmall,
        headlineLarge: AppTextStylesDark.headlineLarge,
        headlineMedium: AppTextStylesDark.headlineMedium,
        headlineSmall: AppTextStylesDark.headlineSmall,
        labelLarge: AppTextStylesDark.labelLarge,
        labelMedium: AppTextStylesDark.labelMedium,
        labelSmall: AppTextStylesDark.labelSmall,
        titleLarge: AppTextStylesDark.titleLarge,
        titleMedium: AppTextStylesDark.titleMedium,
        titleSmall: AppTextStylesDark.titleSmall,
      );
}
