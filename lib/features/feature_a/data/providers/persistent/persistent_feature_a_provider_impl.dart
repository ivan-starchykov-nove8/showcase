import 'package:dartz/dartz.dart';
import 'package:showcase/core/error/failure.dart';
import 'package:showcase/core/usecase/usecase.dart';
import 'package:showcase/features/feature_a/data/models/user_model.dart';
import 'package:showcase/features/feature_a/data/providers/persistent/persistent_feature_a_provider.dart';
import 'package:showcase/features/feature_a/domain/usecases/save_username_usecase/save_username_usecase_params.dart';

class PersistentFeatureAProviderImpl implements PersistentFeatureAProvider {
  @override
  Future<Either<Failure, NoResponse>> deleteUsername({required NoParams params}) {
    // TODO: implement deleteUsername
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserModel>> getUsername({required NoParams params}) {
    // TODO: implement getUsername
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, NoResponse>> saveUsername({required SaveUsernameUseCaseParams params}) {
    // TODO: implement saveUsername
    throw UnimplementedError();
  }
}
