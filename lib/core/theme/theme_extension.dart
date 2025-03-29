import 'package:flutter/material.dart';

/// Extension on [BuildContext] to provide easy access to theme and color palette.
extension ThemeExtension on BuildContext {
  /// Returns the [ThemeData] from the closest [Theme] ancestor.
  ThemeData get theme => Theme.of(this);

  /// Returns the [TextTheme] from the closest [Theme] ancestor.
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Returns the current [ColorPalette] from the [Theme].
  ColorScheme get colors => theme.colorScheme;
}
