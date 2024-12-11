// A utility class for managing gapping - edgeInsets and padding constants
import 'package:flutter/material.dart';

final class AppSpacing {
  // Constant Values
  static const double xs = 3.0;
  static const double s = 5.0;
  static const double md = 7.0;
  static const double large = 9.0;
  static const double xl = 13.0;
  static const double xxl = 17.0;

  // Gapping

  // Verticals
  static SizedBox get verticalGapXs => const SizedBox(height: xs);
  static SizedBox get verticalGapSmall => const SizedBox(height: s);
  static SizedBox get verticalGapMd => const SizedBox(height: md);
  static SizedBox get verticalGapLarge => const SizedBox(height: large);
  static SizedBox get verticalGapXLarge => const SizedBox(height: xl);
  static SizedBox get verticalGapHuge => const SizedBox(height: xxl);
}
