import 'package:flutter/material.dart';
import 'package:showcase/core/resources/palette.dart';

/// Simplified representation of application theming system design.
class ThemeScope extends InheritedWidget {
  const ThemeScope({
    super.key,
    required super.child,
    required ThemeMode themeMode,
  }) : _themeMode = themeMode;

  /// The current theme mode (light, dark, or system).
  final ThemeMode _themeMode;

  static ThemeScope of(BuildContext context) {
    final ThemeScope? result = context.dependOnInheritedWidgetOfExactType<ThemeScope>();
    assert(result != null, 'No ThemeScope found in context');
    return result!;
  }

  /// Returns the current [ThemeMode].
  ThemeMode get themeMode => _themeMode;

  ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.light,
        seedColor: Palette.defaultTextColor,
        error: Palette.errorBackground,
        onError: Palette.errorForeground,
        surface: Palette.errorForeground,
        outline: Palette.defaultBorderColor,
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }

  ThemeData get darkTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: Palette.defaultTextColor,
        error: Palette.errorBackground,
        onError: Palette.errorForeground,
        surface: Palette.errorForeground,
        outline: Palette.defaultBorderColor,
      ),
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      }),
    );
  }

  @override
  bool updateShouldNotify(ThemeScope oldWidget) => true;
}
