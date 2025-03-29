import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:showcase/core/navigation/application_routes.dart';
import 'package:showcase/core/screen_factory/screen_factory.dart';

/// Manages application navigation using GoRouter.
///
/// Provides navigation helpers and route configuration, enabling
/// consistent, centralized control over app routing.
class ApplicationNavigation {
  const ApplicationNavigation._();

  /// Accessor for the navigator key used in non-contextual navigation.
  static GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  /// Provides access to the configured [GoRouter] instance
  /// and centralized control over route definitions and navigation behaviors.
  static GoRouter get router => _router;

  /// A key for [NavigatorState], allowing navigation without a [BuildContext].
  static final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  /// Configures and manages routes with GoRouter.
  static final GoRouter _router = GoRouter(
    initialLocation: ApplicationRoutes.root.path,
    errorBuilder: (_, __) => ScreenFactory.renderError404Screen(),
    routes: [
      GoRoute(
        path: ApplicationRoutes.root.path,
        name: ApplicationRoutes.root.name,
        redirect: (_, __) => ApplicationRoutes.featureA.path,
      ),
      GoRoute(
        path: ApplicationRoutes.featureA.path,
        name: ApplicationRoutes.featureA.name,
        builder: (BuildContext context, GoRouterState state) => ScreenFactory.renderFeatureA(),
      ),
      GoRoute(
        path: ApplicationRoutes.featureB.path,
        name: ApplicationRoutes.featureB.name,
        builder: (BuildContext context, GoRouterState state) => ScreenFactory.renderFeatureB(),
      ),
    ],
  );
}
