import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mobile_application/common/result/result.dart';
import 'package:mobile_application/common/extension/_extension.dart';

/// A mixin to toast a [SnackBar] in order to handle result of an [ActionResult] .
///
/// This mixin should be used for a [StatefulWidget] or [StatelessWidget] that,
/// need to present result of a fetched data [actionResult].
///
/// Example usage:
/// ```dart
/// class MyCustomWidget extends StatelessWidget with ActionResultSnackBarMixin<User>{
///   MyCustomWidget({
///     required ActionResult<User> user,
///   }){
///       actionResult = user;
///    }
///
///
///   @override
///   Widget build(BuildContext context){
///     showResultSnackBar(context);
///     return SomeUICode();
///   }
///
/// }
///
/// ```
mixin ActionResultSnackbarMixin<T> on Widget {
  /// The current action result to be monitored
  late final ActionResult<T> actionResult;

  late final ValueNotifier<ActionResult<T>> _actionResult =
      ValueNotifier<ActionResult<T>>(actionResult);

  /// Shows a snackbar based on the current [ActionResult] state.
  ///
  /// Parameters:
  /// - [context]: BuildContext for showing the snackbar
  /// - [showFailure]: Whether to show error messages (default: true)
  /// - [showSuccess]: Whether to show success messages (default: false)
  /// - [showLoading]: Whether to show loading state messages (default: false)
  /// - [retry]: Optional callback function for retry action on failure
  ///
  /// The snackbar message varies based on the [ActionResult] state:
  /// - [Failure]: Shows error message with optional retry
  /// - [Success]: Shows "Successfully done" message
  /// - [Loading]: Shows "Loading, Please wait" message
  /// - [Idle]: No message shown
  void showResultSnackBar(
    BuildContext context, {
    bool showFailure = true,
    bool showSuccess = false,
    bool showLoading = false,
    void Function()? retry,
  }) {
    SchedulerBinding.instance.addPostFrameCallback(
      (_) {
        switch (_actionResult.value) {
          case Failure failure:
            if (showFailure) {
              context.showErrorToast(
                message: failure.exception.toString(),
                retry: retry,
              );
            }
            break;
          case Success success:
            if (showSuccess) {
              context.showSuccessToast(message: 'Successfully done');
            }
            break;
          case Loading loading:
            if (showLoading) {
              context.showSuccessToast(message: 'Loading, Please wait');
            }
            break;
          case Idle idle:
            break;
          default:
            break;
        }
        // context.showErrorToast(message: 'zaa');
      },
    );
  }
}
