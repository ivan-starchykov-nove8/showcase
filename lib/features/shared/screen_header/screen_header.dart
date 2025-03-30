import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// A reusable header widget that displays a back button and a header text.
class ScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ScreenAppBar({
    super.key,
    required this.title,
    this.previousPageTitle,
    this.onBack,
  });

  final String title;
  final String? previousPageTitle;
  final VoidCallback? onBack;

  /// The preferred size of the app bar, using the default toolbar height.
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      leading: onBack == null
          ? null
          : Align(
              alignment: Alignment.centerLeft,
              child: CupertinoNavigationBarBackButton(
                previousPageTitle: previousPageTitle,
                onPressed: onBack,
              ),
            ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
