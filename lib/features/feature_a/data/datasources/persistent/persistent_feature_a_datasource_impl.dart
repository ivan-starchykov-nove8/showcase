import 'package:dartz/dartz.dart';
import 'package:showcase/core/error/failure.dart';
import 'package:showcase/core/usecase/usecase.dart';
import 'package:showcase/features/feature_a/data/models/user_model.dart';
import 'package:showcase/features/feature_a/data/datasources/persistent/persistent_feature_a_datasource.dart';
import 'package:showcase/features/feature_a/domain/usecases/save_username_usecase/save_username_usecase_params.dart';

class PersistentFeatureAProviderImpl implements PersistentFeatureADatasource {
  String _username = '';

  @override
  Future<Either<Failure, NoResponse>> deleteUsername({required NoParams params}) async {
    _username = '';
    return Right(NoResponse());
  }

  @override
  Future<Either<Failure, UserModel>> getUsername({required NoParams params}) async {
    await Future.delayed(Duration(seconds: 3));
    return Right(UserModel(name: _username));
  }

  @override
  Future<Either<Failure, NoResponse>> saveUsername({
    required SaveUsernameUseCaseParams params,
  }) async {
    _username = params.name;
    return Right(NoResponse());
  }
}
