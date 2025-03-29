import 'package:flutter/widgets.dart';
import 'package:showcase/features/feature_a/domain/entities/user_entity.dart';

/// Sealed class representing all states for Feature A.
@immutable
sealed class FeatureAState {
  const FeatureAState();
}

/// Initial state before any action has been taken.
final class FeatureAInitial extends FeatureAState {
  const FeatureAInitial() : super();
}

/// State indicating that data is being loaded.
final class FeatureALoading extends FeatureAState {
  const FeatureALoading() : super();
}

/// State when a username has been successfully loaded or saved.
final class FeatureANameState extends FeatureAState {
  const FeatureANameState(this.user) : super();

  final UserEntity user;
}

/// State when no username is available and the user must enter one.
final class FeatureAEnterNameState extends FeatureAState {
  const FeatureAEnterNameState() : super();
}
