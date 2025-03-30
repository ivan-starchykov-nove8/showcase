import 'package:flutter/material.dart';
import 'package:showcase/features/feature_d/presentation/widgets/feature_d_navigation_row_widget.dart';
import 'package:showcase/features/feature_d/presentation/widgets/feature_d_number_buttons_widget.dart';
import 'package:showcase/features/shared/screen_header/screen_header.dart';

/// Screen representing the second step (FeatureD) where the user selects a number.
class FeatureDScreen extends StatelessWidget {
  const FeatureDScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar(title: 'Feature D: Step 2'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Spacer(),
              FeatureDNumberButtonsWidget(),
              Spacer(),
              FeatureDNavigationRowWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
