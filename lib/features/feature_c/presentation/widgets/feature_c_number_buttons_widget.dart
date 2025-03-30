import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showcase/features/feature_b/presentation/bloc/feature_b_bloc.dart';
import 'package:showcase/features/feature_b/presentation/bloc/feature_b_event.dart';
import 'package:showcase/features/shared/common_buttons/default_common_button.dart';

class FeatureCNumberButtonsWidget extends StatelessWidget {
  const FeatureCNumberButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(3, (index) {
        final int number = index + 1;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: DefaultCommonButton(
            onPressed: () {
              context.read<FeatureBBloc>().add(StepOneNumberSelected(number));
            },
            child: Text('Select number $number'),
          ),
        );
      }),
    );
  }
}
