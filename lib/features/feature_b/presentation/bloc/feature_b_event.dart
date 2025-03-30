sealed class FeatureBEvent {
  const FeatureBEvent();
}

/// Event dispatched when the user selects a number in step one (FeatureC).
final class StepOneNumberSelected extends FeatureBEvent {
  const StepOneNumberSelected(this.number);

  final int number;
}

/// Event dispatched when the user selects a number in step two (FeatureD).
final class StepTwoNumberSelected extends FeatureBEvent {
  const StepTwoNumberSelected(this.number);

  final int number;
}

/// Event dispatched to trigger sending analytics explicitly.
final class SendAnalyticsEvent extends FeatureBEvent {
  const SendAnalyticsEvent({
    required this.stepOne,
    required this.stepTwo,
  });

  final int stepOne;
  final int stepTwo;
}
