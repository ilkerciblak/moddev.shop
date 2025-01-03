import 'package:flutter/material.dart';
import 'package:mobile_application/common/presentation/toast/_toast.dart';

extension ActionToaster on BuildContext {
  void showSuccessToast({
    required String message,
  }) {
    ScaffoldMessenger.maybeOf(this)?.showSnackBar(
      ActionToast.successToast(message),
    );
  }

  void showErrorToast({
    required String message,
    void Function()? retry,
  }) {
    ScaffoldMessenger.maybeOf(this)?.showSnackBar(
      ActionToast.failureToast(
        message: message,
        retry: retry,
      ),
    );
  }
}
