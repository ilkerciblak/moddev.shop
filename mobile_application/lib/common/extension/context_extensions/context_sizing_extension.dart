// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

extension ContextSizingExtension on BuildContext {
  _ContextSizingExtension get sized => _ContextSizingExtension(this);
}

final class _ContextSizingExtension {
  final BuildContext _context;

  const _ContextSizingExtension(BuildContext context) : _context = context;

  MediaQueryData get mediaQuery => MediaQuery.of(_context);

  /// The parts of the display that are partially obscured by system UI,
  /// typically by the hardware display "notches" or the system status bar.
  EdgeInsets get safeAreaPaddings => mediaQuery.viewPadding;
  //
  double get safeAreaTopPadding => safeAreaPaddings.top;

  double get safeHeight => mediaQuery.size.height - safeAreaTopPadding;
}
