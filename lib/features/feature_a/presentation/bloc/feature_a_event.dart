/// Base class for all Feature A events.
abstract class FeatureAEvent {}

/// Event to load (or check) the username when the bloc initializes.
class LoadNameEvent extends FeatureAEvent {}

/// Event to submit a username entered by the user.
class SubmitNameEvent extends FeatureAEvent {
  final String name;
  SubmitNameEvent(this.name);
}

/// Event to delete the current username.
class DeleteNameEvent extends FeatureAEvent {}