import 'package:flutter/material.dart';
import 'package:mobile_application/common/theme/color/app_colors.dart';

class AppTextStyles {
  static const String _fontFamily = 'Merriweather';

  static TextStyle get displayLarge => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 48.0,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryBlack,
      );

  static TextStyle get displayMedium => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 38.0,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryBlack,
      );

  static TextStyle get displaySmall => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryBlack,
      );

  static TextStyle get headlineLarge => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryBlack,
      );

  static TextStyle get headlineMedium => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 24.0,
        fontWeight: FontWeight.w600,
        color: AppColors.primaryBlack,
      );

  static TextStyle get headlineSmall => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
        color: AppColors.primaryBlack,
      );

  static TextStyle get titleLarge => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: AppColors.primaryBlack,
      );

  static TextStyle get titleMedium => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: AppColors.primaryBlack,
      );

  static TextStyle get titleSmall => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12.0,
        fontWeight: FontWeight.w500,
        color: AppColors.primaryBlack,
      );

  static TextStyle get bodyLarge => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        color: AppColors.primaryBlack,
      );

  static TextStyle get bodyMedium => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: AppColors.primaryBlack,
      );

  static TextStyle get bodySmall => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 10.0,
        fontWeight: FontWeight.normal,
        color: AppColors.primaryBlack,
      );

  static TextStyle get labelLarge => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12.0,
        fontWeight: FontWeight.w600,
        color: AppColors.primaryBlack,
      );

  static TextStyle get labelMedium => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 10.0,
        fontWeight: FontWeight.w500,
        color: AppColors.primaryBlack,
      );

  static TextStyle get labelSmall => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 8.0,
        fontWeight: FontWeight.w400,
        color: AppColors.primaryBlack,
      );

  static TextTheme get textTheme => TextTheme(
        bodyLarge: AppTextStyles.bodyLarge,
        bodyMedium: AppTextStyles.bodyMedium,
        bodySmall: AppTextStyles.bodySmall,
        displayLarge: AppTextStyles.displayLarge,
        displayMedium: AppTextStyles.displayMedium,
        displaySmall: AppTextStyles.displaySmall,
        headlineLarge: AppTextStyles.headlineLarge,
        headlineMedium: AppTextStyles.headlineMedium,
        headlineSmall: AppTextStyles.headlineSmall,
        labelLarge: AppTextStyles.labelLarge,
        labelMedium: AppTextStyles.labelMedium,
        labelSmall: AppTextStyles.labelSmall,
        titleLarge: AppTextStyles.titleLarge,
        titleMedium: AppTextStyles.titleMedium,
        titleSmall: AppTextStyles.titleSmall,
      );
}
