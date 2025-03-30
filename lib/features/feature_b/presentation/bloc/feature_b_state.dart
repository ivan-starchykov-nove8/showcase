import 'package:equatable/equatable.dart';

abstract class FeatureBState extends Equatable {
  const FeatureBState();

  @override
  List<Object?> get props => [];
}

/// Initial state before any selection.
final class FeatureBInitial extends FeatureBState {
  const FeatureBInitial();
}

/// State after the first step is complete.
final class FeatureBStepOneCompleted extends FeatureBState {
  const FeatureBStepOneCompleted(this.stepOneNumber);

  final int stepOneNumber;

  @override
  List<Object?> get props => [stepOneNumber];
}

/// State after the second step is complete.
final class FeatureBStepTwoCompleted extends FeatureBState {
  const FeatureBStepTwoCompleted(this.stepOneNumber, this.stepTwoNumber);

  final int stepOneNumber;
  final int stepTwoNumber;

  @override
  List<Object?> get props => [stepOneNumber, stepTwoNumber];
}
