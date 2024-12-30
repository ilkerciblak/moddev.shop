// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:mobile_application/common/_common.dart';

/// A Stateless Widget Mixin for [Content] named Presentation Layer Elements,
///
/// - @override [buildLoading] method for [loading state] of the ActionResult
/// - @override [buildErrorState] method for [failure state] of the ActionResult
/// - @override [buildSuccess] method for [success state] of the ActionResutl
///
/// Usage:
///
/// Override or assing a [ActionResult<T>] object as [actionResult] in your constructors closure:
///
/// ```dart
///
/// final ActionResult<Product> productResult;
///
/// SomeStatelessWidget({super.key}){
///   actionResult = productResult;
/// }
///
/// ```
///
///
/// Built UI with using `buildByStatus` method in your [StatelessWidget] to show view based on the ActionResult as follows
///
/// ```dart
/// @override
///  Widget build(BuildContext context) {
///    return buildByStatus(context);
///  }

mixin ActionResultPresenterMixin<T> on StatelessWidget {
  @protected
  late final ActionResult<T> actionResult;

  late final ValueNotifier<ActionResult<T>> _actionResult =
      ValueNotifier<ActionResult<T>>(actionResult);

  @protected
  Widget buildLoading(BuildContext context);
  @protected
  Widget buildSuccess(BuildContext context, T value);
  @protected
  Widget buildErrorState(BuildContext context, Exception exception);

  Widget buildByStatus(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _actionResult,
      builder: (context, value, child) {
        switch (value) {
          case Success success:
            return buildSuccess(context, success.value);
          case Failure failure:
            return buildErrorState(context, failure.exception);
          case Loading loading:
            return buildLoading(context);
          case Idle idle:
            return buildLoading(context);
        }
      },
    );
  }
}
