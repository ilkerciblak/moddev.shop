// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

extension ContextThemeExtension on BuildContext {
  _ContextThemeExtension get theme => _ContextThemeExtension(this);
}

final class _ContextThemeExtension {
  final BuildContext _context;

  _ContextThemeExtension(BuildContext context) : _context = context;

  TextTheme get textTheme => Theme.of(_context).textTheme;
  TextStyle? get displayLarge => Theme.of(_context).textTheme.displayLarge;
  TextStyle? get displayMedium => Theme.of(_context).textTheme.displayMedium;
  TextStyle? get displaySmall => Theme.of(_context).textTheme.displaySmall;
  TextStyle? get headlineLarge => Theme.of(_context).textTheme.headlineLarge;
  TextStyle? get headlineMedium => Theme.of(_context).textTheme.headlineMedium;
  TextStyle? get headlineSmall => Theme.of(_context).textTheme.headlineSmall;
  TextStyle? get titleLarge => Theme.of(_context).textTheme.titleLarge;
  TextStyle? get titleMedium => Theme.of(_context).textTheme.titleMedium;
  TextStyle? get titleSmall => Theme.of(_context).textTheme.titleSmall;
  TextStyle? get labelLarge => Theme.of(_context).textTheme.labelLarge;
  TextStyle? get labelMedium => Theme.of(_context).textTheme.labelMedium;
  TextStyle? get labelSmall => Theme.of(_context).textTheme.labelSmall;
  TextStyle? get bodyLarge => Theme.of(_context).textTheme.bodyLarge;
  TextStyle? get bodyMedium => Theme.of(_context).textTheme.bodyMedium;
  TextStyle? get bodySmall => Theme.of(_context).textTheme.bodySmall;
}
