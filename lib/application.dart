import 'package:flutter/material.dart';
import 'package:showcase/core/navigation/application_navigation.dart';
import 'package:showcase/core/theme/theme_scope.dart';

class ShowcaseApplication extends StatelessWidget {
  const ShowcaseApplication({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeScope theme = ThemeScope.of(context);

    return MaterialApp.router(
      key: ApplicationNavigation.navigatorKey,
      debugShowCheckedModeBanner: false,
      themeMode: theme.themeMode,
      theme: theme.lightTheme,
      darkTheme: theme.darkTheme,
      routerConfig: ApplicationNavigation.router,
    );
  }
}
