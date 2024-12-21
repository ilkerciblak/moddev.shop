import 'package:flutter/material.dart';
import 'package:mobile_application/common/theme/_theme.dart';

final class ActionToast extends SnackBar {
  final String message;
  ActionToast({
    super.key,
    required Color backgroundColor,
    required this.message,

    // required this.action,
  }) : super(
          content: Text(message),
          backgroundColor: backgroundColor.withOpacity(0.5),
          behavior: SnackBarBehavior.floating,
        );

  factory ActionToast.successToast(String message) => ActionToast(
        backgroundColor: AppColors.primaryGreen,
        message: message,
      );

  factory ActionToast.failureToast(String message) => ActionToast(
        backgroundColor: AppColors.primaryAlert,
        message: message,
      );
}
