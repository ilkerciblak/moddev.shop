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
  Future<void> withGoNamedRoute(
    BuildContext context, {
    required String pathName,
    Map<String, String> pathParameters = const {},
  }) {
    return then(
      (result) {
        switch (result) {
          case Success<T> success:
            context.goNamed(pathName, pathParameters: pathParameters);
            break;
          default:
        }
      },
    );
  }

  /// Navigates to new route `pathName` with adding new screen to the navigation stack, using Go_Router's `pushNamed` method
  ///
  /// - [BuildContext context] app context
  /// - [String pathName] route name to be navigated
  /// - [Map<String, String> pathParameters]
  /// - [Returns] a Future<void> function
  Future<void> withPushNamedRoute(
    BuildContext context, {
    required String pathName,
    Map<String, String> pathParameters = const {},
  }) {
    return then(
      (result) {
        switch (result) {
          case Success<T> success:
            context.pushNamed(pathName, pathParameters: pathParameters);
            break;
          default:
        }
      },
    );
  }
}
