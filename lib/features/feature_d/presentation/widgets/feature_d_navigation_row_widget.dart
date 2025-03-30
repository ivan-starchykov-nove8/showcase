import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:showcase/core/navigation/application_routes.dart';
import 'package:showcase/core/resources/gaps.dart';
import 'package:showcase/features/feature_b/presentation/bloc/feature_b_bloc.dart';
import 'package:showcase/features/feature_b/presentation/bloc/feature_b_state.dart';
import 'package:showcase/features/shared/common_buttons/default_common_button.dart';

class FeatureDNavigationRowWidget extends StatelessWidget {
  const FeatureDNavigationRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DefaultCommonButton(
            onPressed: context.pop,
            child: const Text('Back'),
          ),
        ),
        Gap.w16,
        Expanded(
          child: BlocBuilder<FeatureBBloc, FeatureBState>(
            builder: (context, state) {
              final bool isActionAllowed = state is FeatureBStepTwoCompleted;
              return DefaultCommonButton(
                onPressed: isActionAllowed ? () => _navigateToFeatureE(context, state) : null,
                child: const Text('Done'),
              );
            },
          ),
        ),
      ],
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
