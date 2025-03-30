import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:showcase/core/navigation/application_routes.dart';
import 'package:showcase/features/feature_b/presentation/bloc/feature_b_bloc.dart';
import 'package:showcase/features/feature_b/presentation/bloc/feature_b_event.dart';
import 'package:showcase/features/feature_b/presentation/bloc/feature_b_state.dart';
import 'package:showcase/features/feature_b/presentation/widgets/feature_b_label_widget.dart';

/// The shell for FeatureB. It wraps the child widget (provided by the shell route)
/// with a [FeatureBBloc] so that FeatureC and FeatureD can dispatch their events.
class FeatureBScreen extends StatelessWidget {
  const FeatureBScreen({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<FeatureBBloc, FeatureBState>(
      listener: (context, state) => _onStateChange(context, state),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FeatureBLabelWidget(),
              Expanded(child: child),
            ],
          ),
        ),
      ),
    );
  }

  /// Handles state changes by invoking dedicated methods for sending analytics and navigation.
  void _onStateChange(BuildContext context, FeatureBState state) {
    if (state is FeatureBStepTwoCompleted) {
      _sendAnalytics(context, state);
      _navigateToFeatureE(context, state);
    }
  }

  /// Sends analytics using the current state.
  void _sendAnalytics(BuildContext context, FeatureBStepTwoCompleted state) {
    context.read<FeatureBBloc>().add(
          SendAnalyticsEvent(
            stepOne: state.stepOneNumber,
            stepTwo: state.stepTwoNumber,
          ),
        );
  }

  /// Navigates to FeatureE and passes the sum of the selected numbers as an extra parameter.
  void _navigateToFeatureE(BuildContext context, FeatureBStepTwoCompleted state) {
    context.push(
      ApplicationRoutes.featureE.path,
      extra: state.stepOneNumber + state.stepTwoNumber,
    );
  }
}
