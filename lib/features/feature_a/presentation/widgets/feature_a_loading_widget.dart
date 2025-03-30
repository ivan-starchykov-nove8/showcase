import 'package:flutter/material.dart';

class FeatureALoadingWidget extends StatelessWidget {
  const FeatureALoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
