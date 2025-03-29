import 'package:flutter/widgets.dart';

/// Enumeration of possible types for exceptions related to network requests.
enum RequestExceptionType {
  badRequest,
  unauthorized,
  forbidden,
  notFound,
  timeout,
  internalServerError,
  networkError,
  other,
}

/// Abstract base class representing a failure in the application.
///
/// This class serves as the base for different types of failures that can occur during application execution.
/// It allows for categorization and handling of different failure scenarios.
@immutable
sealed class Failure {
  /// Constructor for [Failure].
  const Failure({required this.errorMessage});

  /// The error message associated with the failure.
  final String errorMessage;

  @override
  String toString() => 'Failure{errorMessage: $errorMessage}';
}

/// Represents a failure caused by a server-side error.
///
/// This class provides details about server-related failures, including the type of failure,
/// error code, and an error message.
@immutable
final class ServerFailure extends Failure {
  /// Constructor for [ServerFailure].
  ///
  /// [type] The type of server exception (default is [RequestExceptionType.other]).
  /// [code] The error code (default is 0).
  /// [url] The API endpoint URL (default is an empty string).
  const ServerFailure({
    this.type = RequestExceptionType.other,
    this.code = 0,
    this.url = '',
    super.errorMessage = '',
  });

  /// The type of server exception.
  final RequestExceptionType type;

  /// The error code associated with the exception.
  final int code;

  /// API endpoint URL address.
  final String url;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ServerFailure &&
          runtimeType == other.runtimeType &&
          errorMessage == other.errorMessage &&
          type == other.type &&
          code == other.code &&
          url == other.url;

  @override
  int get hashCode => errorMessage.hashCode ^ type.hashCode ^ code.hashCode ^ url.hashCode;

  @override
  String toString() =>
      'ServerFailure{errorMessage: $errorMessage, type: $type, code: $code, url: $url}';
}

/// Represents a failure caused by a database error.
///
/// This class provides details about database-related failures.
@immutable
final class DatabaseFailure extends Failure {
  const DatabaseFailure({required super.errorMessage});

  @override
  String toString() => 'DatabaseFailure{errorMessage: $errorMessage}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DatabaseFailure &&
          runtimeType == other.runtimeType &&
          errorMessage == other.errorMessage;

  @override
  int get hashCode => errorMessage.hashCode;
}