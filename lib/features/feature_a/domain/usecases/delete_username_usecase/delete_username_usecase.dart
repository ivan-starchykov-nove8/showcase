import 'package:dartz/dartz.dart';
import 'package:showcase/core/error/failure.dart';
import 'package:showcase/core/usecase/usecase.dart';
import 'package:showcase/features/feature_a/domain/repositories/feature_a_repository.dart';

final class DeleteUsernameUseCase implements UseCase<NoResponse, NoParams> {
  const DeleteUsernameUseCase({required this.repository});

  final FeatureARepository repository;

  @override
  Future<Either<Failure, NoResponse>> call(NoParams params) {
    return repository.deleteUsername(params: params);
  }
}