import 'package:dartz/dartz.dart';
import 'package:showcase/core/error/failure.dart';
import 'package:showcase/core/usecase/usecase.dart';
import 'package:showcase/features/feature_a/domain/repositories/feature_a_repository.dart';
import 'package:showcase/features/feature_a/domain/usecases/save_username_usecase/save_username_usecase_params.dart';

final class SaveUsernameUseCase implements UseCase<NoResponse, SaveUsernameUseCaseParams> {
  const SaveUsernameUseCase({required this.repository});

  final FeatureARepository repository;

  @override
  Future<Either<Failure, NoResponse>> call(SaveUsernameUseCaseParams params) {
    return repository.saveUsername(params: params);
  }
}
