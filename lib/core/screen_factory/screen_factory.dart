import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showcase/application.dart';
import 'package:showcase/core/theme/theme_scope_widget.dart';
import 'package:showcase/features/feature_a/presentation/bloc/feature_a_bloc.dart';
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
      child: Placeholder(),
    );
  }

  static Widget renderFeatureB() {
    return Placeholder();
  }

  static Widget renderFeatureC() {
    return Placeholder();
  }

  static Widget renderError404Screen() {
    return const Placeholder();
  }

  static Page<dynamic> renderSuccessMessage() {
    return DialogModalPage(
      builder: (context) => const Placeholder(),
    );
  }
}
