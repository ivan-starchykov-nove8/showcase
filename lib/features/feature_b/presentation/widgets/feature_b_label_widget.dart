import 'package:flutter/material.dart';

class FeatureBLabelWidget extends StatelessWidget {
  const FeatureBLabelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: DecoratedBox(
        decoration: BoxDecoration(color: Colors.blueAccent.withValues(alpha: .2)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Feature B Shell', style: Theme.of(context).textTheme.labelSmall),
        ),
      ),
    );
  }
}
