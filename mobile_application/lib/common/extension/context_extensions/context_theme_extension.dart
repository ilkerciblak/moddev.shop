// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

extension ContextThemeExtension on BuildContext {
  _ContextTextThemeExtension get textTheme => _ContextTextThemeExtension(this);
  _ContextColorThemeExtension get scaffoldTheme =>
      _ContextColorThemeExtension(this);
}

final class _ContextTextThemeExtension {
  final BuildContext _context;

  _ContextTextThemeExtension(BuildContext context) : _context = context;

  TextTheme get textTheme => Theme.of(_context).textTheme;
  TextStyle? get displayLarge => textTheme.displayLarge;
  TextStyle? get displayMedium => textTheme.displayMedium;
  TextStyle? get displaySmall => textTheme.displaySmall;
  TextStyle? get headlineLarge => textTheme.headlineLarge;
  TextStyle? get headlineMedium => textTheme.headlineMedium;
  TextStyle? get headlineSmall => textTheme.headlineSmall;
  TextStyle? get titleLarge => textTheme.titleLarge;
  TextStyle? get titleMedium => textTheme.titleMedium;
  TextStyle? get titleSmall => textTheme.titleSmall;
  TextStyle? get labelLarge => textTheme.labelLarge;
  TextStyle? get labelMedium => textTheme.labelMedium;
  TextStyle? get labelSmall => textTheme.labelSmall;
  TextStyle? get bodyLarge => textTheme.bodyLarge;
  TextStyle? get bodyMedium => textTheme.bodyMedium;
  TextStyle? get bodySmall => textTheme.bodySmall;
}

final class _ContextColorThemeExtension {
  final BuildContext _context;

  _ContextColorThemeExtension(BuildContext context) : _context = context;

  Color? get scaffoldBackgroundColor =>
      Theme.of(_context).scaffoldBackgroundColor;

  // Color? get color => Theme.of(_context);
}
