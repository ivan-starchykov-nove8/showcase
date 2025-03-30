import 'package:flutter/material.dart';
import 'package:showcase/features/feature_c/presentation/widgets/feature_c_navigation_row_widget.dart';
import 'package:showcase/features/feature_c/presentation/widgets/feature_c_number_buttons_widget.dart';
import 'package:showcase/features/shared/screen_header/screen_header.dart';

/// Screen representing the first step (FeatureC) where the user selects a number.
class FeatureCScreen extends StatelessWidget {
  const FeatureCScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar(title: 'Feature C: Step 1'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Spacer(),
              FeatureCNumberButtonsWidget(),
              Spacer(),
              FeatureCNavigationRowWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
