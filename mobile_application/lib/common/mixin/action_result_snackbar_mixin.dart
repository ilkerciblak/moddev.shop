import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_application/common/result/result.dart';

mixin ActionResultSnackbarMixin<T> on StatelessWidget {
  late final ActionResult<T> actionResult;

  late final ValueNotifier<ActionResult<T>> _actionResult =
      ValueNotifier<ActionResult<T>>(actionResult);
}
