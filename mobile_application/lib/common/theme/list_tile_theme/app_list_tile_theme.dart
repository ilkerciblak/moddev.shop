import 'package:flutter/material.dart';
import 'package:mobile_application/common/theme/color/app_colors.dart';

final class AppListTileTheme {
  static ListTileThemeData listTileThemeDataDark = ListTileThemeData(
    tileColor: AppColors.primarySilver.withOpacity(0.7),
    minVerticalPadding: 2,
  );
}
