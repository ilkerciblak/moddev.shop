import 'package:flutter/widgets.dart';
import 'package:mobile_application/common/result/result.dart';

@immutable
final class FutureHelper {
  static Future<void> chainFutureMethods<T>(
      List<Future<ActionResult<T>> Function()> features) async {
    for (var feature in features) {
      var lastResult = await feature();
      if (lastResult is Failure) {
        return;
      }
    }
  }
}
