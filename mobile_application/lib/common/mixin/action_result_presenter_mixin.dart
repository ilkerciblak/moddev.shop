// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:mobile_application/common/_common.dart';

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
