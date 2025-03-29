import 'package:dartz/dartz.dart';
import 'package:showcase/core/error/failure.dart';
import 'package:showcase/core/usecase/usecase.dart';
import 'package:showcase/features/feature_a/domain/entities/user_entity.dart';
import 'package:showcase/features/feature_a/domain/repositories/feature_a_repository.dart';

final class GetUsernameUseCase implements UseCase<UserEntity, NoParams> {
  const GetUsernameUseCase({required this.repository});

  final FeatureARepository repository;

  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) {
    return repository.getUsername(params: params);
  }
}