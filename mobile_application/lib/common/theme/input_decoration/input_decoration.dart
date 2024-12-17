import 'package:flutter/material.dart';
import 'package:mobile_application/common/_common.dart';

class AppFormTheme {
  InputDecorationTheme get inputDecorationThemeLight => InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(vertical: 11, horizontal: 8),
        isDense: true,
        // floatingLabelBehavior: FloatingLabelBehavior.always,
        errorMaxLines: 1,
        filled: true,
        fillColor: AppColors.primarySilver,

        // Borders
        enabledBorder: _buildBorder(
          color: AppColors.primarySilver,
          // borderWidth: 1,
        ),
        disabledBorder: _buildBorder(
          color: Colors.grey[400]!,
          // borderWidth: 1,
        ),
        focusedBorder: _buildBorder(
          color: AppColors.primaryGreen,
          // borderWidth: 1,
        ),
        errorBorder: _buildBorder(
          color: Colors.red,
          // borderWidth: 1.5,
        ),
        focusedErrorBorder: _buildBorder(
          color: Colors.red,
          borderWidth: 1,
        ),

        // TextStyles
        suffixStyle: _buildTextStyle(
          appFontStyle: AppTextStyles.labelSmall,
        ),
        counterStyle: _buildTextStyle(
          appFontStyle: AppTextStyles.labelSmall,
        ),
        hintStyle: _buildTextStyle(
          appFontStyle: AppTextStyles.labelMedium,
        ),
        errorStyle: _buildTextStyle(
          appFontStyle: AppTextStyles.labelLarge,
        ),
        labelStyle: _buildTextStyle(
          appFontStyle: AppTextStyles.labelMedium,
        ),
      );
  InputDecorationTheme get inputDecorationThemeDark => InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(vertical: 11, horizontal: 8),
        isDense: true,
        // floatingLabelBehavior: FloatingLabelBehavior.always,
        errorMaxLines: 1,
        filled: true,
        fillColor: AppColors.primarySilver,

        // Borders
        enabledBorder: _buildBorder(
          color: AppColors.primarySilver,
          // borderWidth: 1,
        ),
        disabledBorder: _buildBorder(
          color: Colors.grey[400]!,
          // borderWidth: 1,
        ),
        focusedBorder: _buildBorder(
          color: AppColors.primaryGreen,
          // borderWidth: 1,
        ),
        errorBorder: _buildBorder(
          color: Colors.red,
          // borderWidth: 1.5,
        ),
        focusedErrorBorder: _buildBorder(
          color: Colors.red,
          borderWidth: 1,
        ),

        // TextStyles
        suffixStyle: _buildTextStyle(
            appFontStyle: AppTextStyles.labelSmall,
            color: AppColors.secondaryWhite),
        counterStyle: _buildTextStyle(
            appFontStyle: AppTextStyles.labelSmall,
            color: AppColors.secondaryWhite),
        hintStyle: _buildTextStyle(
          appFontStyle: AppTextStyles.labelMedium,
        ),
        errorStyle: _buildTextStyle(
          appFontStyle: AppTextStyles.labelMedium,
          color: AppColors.secondaryWhite,
        ),
        labelStyle: _buildTextStyle(
          appFontStyle: AppTextStyles.labelMedium,
        ),
      );

  TextStyle _buildTextStyle({
    Color? color,
    TextStyle? appFontStyle,
  }) {
    var font = appFontStyle ?? AppTextStyles.bodySmall;
    return font.copyWith(color: color);
  }

  OutlineInputBorder _buildBorder({
    Color color = AppColors.primaryBlack,
    double borderRadius = 5,
    double borderWidth = 2,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(
        width: borderWidth,
        color: color,
      ),
    );
  }
}
