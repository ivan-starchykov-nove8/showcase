import 'package:equatable/equatable.dart';

final class SendAnalyticsUseCaseParams extends Equatable {
  const SendAnalyticsUseCaseParams({
    required this.eventName,
    this.properties = const {},
  });

  final String eventName;
  final Map<String, dynamic> properties;

  @override
  List<Object?> get props => [eventName, properties];
}
