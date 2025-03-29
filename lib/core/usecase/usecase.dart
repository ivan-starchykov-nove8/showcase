import 'package:dartz/dartz.dart';
import 'package:showcase/core/error/failure.dart';

abstract interface class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// Class to handle when useCase don't need params
final class NoParams {
  Map<String, dynamic> toJson() => {};
}

/// Class to handle when useCase don't need response
final class NoResponse {
  const NoResponse();

  factory NoResponse.fromJson(_) => const NoResponse();
}
