import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:showcase/features/shared/screen_header/screen_header.dart';

final class FeatureEScreen extends StatelessWidget {
  const FeatureEScreen({super.key, required this.params});

  final int params;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar(
        title: 'Summary',
        onBack: context.pop,
      ),
      body: Center(
        child: Text(
          'The sum is: $params',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
