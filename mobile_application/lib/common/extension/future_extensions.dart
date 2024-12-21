// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_application/common/_common.dart';

/// An [Future<ActionResult<T>>] extension that allows routing actions based on whether action result is success or fails.
/// [ActionResult] is typedefinition of [Result<Exception,T>]
/// [T] is the generic type

extension RotingExtension<T> on Future<ActionResult<T>> {
  /// Navigates to new route `pathName` with replacing the current navigation stack with a new one, using Go_Router's `goNamed` method
  ///
  /// - [BuildContext context] app context
  /// - [String pathName] route name to be navigated
  /// - [Map<String, String> pathParameters]
  /// - [Returns] a Future<void> function
  Future<ActionResult<T>> withGoNamedRoute(
    BuildContext context, {
    required String pathName,
    Map<String, String> pathParameters = const {},
  }) {
    then(
      (result) {
        switch (result) {
          case Success<T> success:
            context.goNamed(pathName, pathParameters: pathParameters);
            break;
          default:
        }
      },
    );
    return this;
  }

  /// Navigates to new route `pathName` with adding new screen to the navigation stack, using Go_Router's `pushNamed` method
  ///
  /// - [BuildContext context] app context
  /// - [String pathName] route name to be navigated
  /// - [Map<String, String> pathParameters]
  /// - [Returns] a Future<void> function
  Future<ActionResult<T>> withPushNamedRoute(
    BuildContext context, {
    required String pathName,
    Map<String, String> pathParameters = const {},
  }) {
    then(
      (result) {
        switch (result) {
          case Success<T> success:
            context.pushNamed(pathName, pathParameters: pathParameters);
            break;
          default:
        }
      },
    );

    return this;
  }

  /// Shows Snackbar Message of given Future<ActionResult<T>> action,
  ///
  /// - [BuildContext context] app context
  /// - @param [String successMessage] to set success message
  ///
  /// - `Shows Error Snackbar` using exception of [Failure.exception]
  /// - `Shows Success Snackbar` using pre-defined `[Successfull Request]` message, this message can be replaced using
  /// @param `[String] successMessage`
  Future<ActionResult<T>> showActionResultToast(
    BuildContext context, {
    String? successMessage,
  }) {
    then(
      (result) {
        return result.match(
          onSuccess: (r) {
            if (successMessage != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(successMessage),
                ),
              );
            }
          },
          onFailure: (l) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(l.toString())));
          },
        );
      },
    );

    return this;
  }
}
