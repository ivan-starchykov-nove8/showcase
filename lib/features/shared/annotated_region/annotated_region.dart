import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AnnotatedRegionWrapper extends StatelessWidget {
  const AnnotatedRegionWrapper({
    super.key,
    required this.child,
    this.statusBarColor = Colors.transparent,
    this.systemNavigationBarColor = Colors.black,
    this.systemNavigationBarIconBrightness = Brightness.light,
    this.statusBarIconBrightness = Brightness.dark,
    this.statusBarBrightness = Brightness.light,
  });

  /// The widget that will be wrapped by the AnnotatedRegion.
  final Widget child;

  /// Color of the status bar background.
  final Color statusBarColor;

  /// Brightness of the status bar icons (dark or light).
  final Brightness statusBarIconBrightness;

  /// Brightness for status bar when it is tapped or shown in iOS (light or dark mode).
  final Brightness statusBarBrightness;

  /// Color of the system navigation bar (usually at the bottom of the screen).
  final Color systemNavigationBarColor;

  /// Brightness of the system navigation bar icons.
  final Brightness systemNavigationBarIconBrightness;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: statusBarColor,
        statusBarIconBrightness: statusBarIconBrightness,
        statusBarBrightness: statusBarBrightness,
        systemNavigationBarColor: systemNavigationBarColor,
        systemNavigationBarIconBrightness: systemNavigationBarIconBrightness,
      ),
      child: child,
    );
  }
}