import 'package:flutter/material.dart';
import 'package:mobile_application/common/theme/_theme.dart';

final class ActionToast extends SnackBar {
  final String message;
  ActionToast({
    super.key,
    required Color backgroundColor,
    required this.message,
    SnackBarAction? snackBarAction,

    // required this.action,
  }) : super(
          content: Text(message),
          backgroundColor: backgroundColor.withOpacity(0.5),
          behavior: SnackBarBehavior.floating,
          action: snackBarAction,
        );

  factory ActionToast.successToast(String message) => ActionToast(
        backgroundColor: AppColors.primaryGreen,
        message: message,
      );

  factory ActionToast.failureToast({
    required String message,
    void Function()? retry,
  }) =>
      ActionToast(
        backgroundColor: AppColors.primaryAlert,
        message: message,
        snackBarAction: retry != null
            ? SnackBarAction(
                label: 'Try Again',
                onPressed: retry,
              )
            : null,
      );
}
