import 'package:flutter/material.dart';

/// A custom [Page] that presents a dialog-style overlay using [DialogRoute].
///
/// This page allows displaying content in a dialog-style overlay using
/// a [DialogRoute].
class DialogModalPage<T> extends Page<T> {
  /// Creates a [DialogModalPage] instance with customizable properties.
  const DialogModalPage({
    required this.builder,
    this.anchorPoint,
    this.barrierColor = Colors.black54,
    this.barrierDismissible = true,
    this.barrierLabel,
    this.useSafeArea = true,
    this.themes,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
  });

  /// Position offset for the dialog.
  final Offset? anchorPoint;

  /// Color of the barrier behind the dialog.
  ///
  /// Defaults to [Colors.black54].
  final Color? barrierColor;

  /// If true, tapping outside the dialog dismisses it.
  ///
  /// Defaults to true.
  final bool barrierDismissible;

  /// Accessibility label for the barrier.
  final String? barrierLabel;

  /// If true, the dialog respects safe area constraints.
  ///
  /// Defaults to true.
  final bool useSafeArea;

  /// Additional themes for the dialog content.
  final CapturedThemes? themes;

  /// Builds the content widget for the dialog.
  final WidgetBuilder builder;

  @override
  Route<T> createRoute(BuildContext context) {
    return DialogRoute<T>(
      context: context,
      settings: this,
      builder: builder,
      themes: themes,
      anchorPoint: anchorPoint,
      barrierColor: barrierColor,
      barrierDismissible: barrierDismissible,
      barrierLabel: barrierLabel,
    );
  }
}
