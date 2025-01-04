// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobile_application/common/presentation/toast/_toast.dart';

/// An extension for [BuildContext] to provide toast notifications more functionally.
///
/// This extension simplifies the process of the showing [SnackBar] by using easy to use
/// extension methods over [context.toaster] getter
///
/// Example Usage:
/// ```dart
///   context.toaster.showSuccessToast(message: 'Completed the Process!');
/// ```
///
///
///
/// see [_ToasterExtension] for extension methods
extension ToasterExtension on BuildContext {
  /// Provides access to [_ToasterExtension] by [context.toaster]
  _ToasterExtension get toaster => _ToasterExtension(this);
}

/// Internal implementation class for the [ToasterExtension] extension.
///
/// This class handles the actual display of the [SnackBar] using [ScaffoldMessenger] of current context.
/// It should not be initated directly, instead use [context.toaster] getter to more convenient usage.
final class _ToasterExtension {
  /// Current [BuildContext] of the application that toaster will be shown
  final BuildContext _context;

  /// Constructor for [_ToasterExtension] class
  ///
  /// [BuildContext] context parameters is required to set private _context variable that
  /// will be used to access [ScaffoldMessenger] instance
  _ToasterExtension(BuildContext context) : _context = context;

  /// Internally provides easy access to [ScaffoldMessenger] associated to current [BuildContext]
  ScaffoldMessengerState get _messenger => ScaffoldMessenger.of(_context);

  /// Shows a Success Toast with a message.
  ///
  /// Use this method to show positive feedback message to user after a successfull
  /// process or operation.
  ///
  /// Parameters:
  /// * `String` [message]: The success message to display in the toaster
  void showSuccessToast({
    required String message,
  }) {
    _messenger.showSnackBar(ActionToast.successToast(message));
  }

  /// Shows a Failure Toast with a message and optional retry action.
  ///
  /// Typical usage is to display a failure toaster to the user after a operation fails. An optional retry [VoidCallback]
  /// can be provided in order to allow the user to attempt same operation once again.
  ///
  /// Parameters:
  /// * `String` [message]: The exception message to display in toaster
  /// * `VoidCallback?` [retry]: Optional retry callback function that will be called when user taps the retry button.
  /// No retry button will be shown if it is [null].
  ///
  ///  Example:
  /// ```dart
  /// context.toaster.showFailureToast(
  ///   message: "Failed to update profile",
  ///   retry: () => updateProfile(),
  /// );
  /// ```
  void showFailureToast({
    required String message,
    VoidCallback? retry,
  }) {
    _messenger.showSnackBar(
      ActionToast.failureToast(
        message: message,
        retry: retry,
      ),
    );
  }
}
