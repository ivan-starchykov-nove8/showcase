import 'package:flutter/material.dart';
import 'package:showcase/core/theme/theme_scope.dart';

/// Simplified representation of application theming system design.
class ThemeScopeWidget extends StatelessWidget {
  const ThemeScopeWidget({
    super.key,
    required this.child,
  });

  /// The widget below this widget in the tree.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ThemeScope(
      themeMode: ThemeMode.light,
      child: child,
    );
  }
}
