import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showcase/application.dart';
import 'package:showcase/core/theme/theme_scope_widget.dart';
import 'package:showcase/features/feature_a/presentation/bloc/feature_a_bloc.dart';
import 'package:showcase/features/feature_a/presentation/screens/feature_a_screen.dart';
import 'package:showcase/features/feature_b/presentation/bloc/feature_b_bloc.dart';
import 'package:showcase/features/feature_b/presentation/screens/feature_b_screen.dart';
import 'package:showcase/features/feature_c/presentation/screens/feature_c_screen.dart';
import 'package:showcase/features/feature_d/presentation/screens/feature_d_screen.dart';
import 'package:showcase/features/feature_e/presentation/screens/feature_e_screen.dart';
import 'package:showcase/features/shared/annotated_region/annotated_region.dart';
import 'package:showcase/features/shared/route_modal_pages/modal_dialog_page.dart';
import 'package:showcase/injection.dart';

final class ScreenFactory {
  const ScreenFactory._();

  static Widget renderApplication() {
    return const AnnotatedRegionWrapper(
      child: ThemeScopeWidget(child: ShowcaseApplication()),
    );
  }

  static Widget renderFeatureA() {
    return BlocProvider(
      create: (context) => sl<FeatureABloc>(),
      child: FeatureAScreen(),
    );
  }

  static Widget renderFeatureB({required Widget child}) {
    return BlocProvider(
      create: (_) => sl<FeatureBBloc>(),
      child: FeatureBScreen(child: child),
    );
  }

  static Widget renderFeatureC() {
    return const FeatureCScreen();
  }

  static Widget renderFeatureD() {
    return const FeatureDScreen();
  }

  static Page<dynamic> renderFeatureE({required int params}) {
    return DialogModalPage(
      builder: (context) => FeatureEScreen(params: params),
    );
  }

  static Widget renderError404Screen() {
    return const Scaffold(
      body: Center(child: Text('404 - Page not found')),
    );
  }
}
