import 'package:flutter/material.dart';

extension OpacityX on TextStyle {
  TextStyle withOpacity(double opacity) {
    return copyWith(color: color?.withOpacity(opacity));
  }
}
