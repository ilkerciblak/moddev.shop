import 'package:flutter/material.dart';
import 'package:mobile_application/common/_common.dart';

mixin ActionResultPresenterMixin<T> on StatelessWidget {
  @protected
  late final ActionResult<T> actionResult;

  late final ValueNotifier<ActionResult> _actionResult =
      ValueNotifier<ActionResult>(actionResult);

  @protected
  Widget buildLoading(BuildContext context);
  @protected
  Widget buildSuccess(BuildContext context);
  @protected
  Widget buildErrorState(BuildContext context);

  Widget buildByStatus(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _actionResult,
      builder: (context, value, child) {
        switch (value) {
          case Success():
            return buildSuccess(context);
          case Failure():
            return buildErrorState(context);
          case Loading():
            return buildLoading(context);
          case Idle():
            return buildLoading(context);
        }
      },
    );
  }
}
