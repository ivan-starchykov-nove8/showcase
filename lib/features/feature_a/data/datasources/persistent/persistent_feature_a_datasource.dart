import 'package:dartz/dartz.dart';
import 'package:showcase/core/error/failure.dart';
import 'package:showcase/core/usecase/usecase.dart';
import 'package:showcase/features/feature_a/data/models/user_model.dart';
import 'package:showcase/features/feature_a/domain/usecases/save_username_usecase/save_username_usecase_params.dart';

abstract interface class PersistentFeatureADatasource {
  Future<Either<Failure, NoResponse>> saveUsername({required SaveUsernameUseCaseParams params});

  Future<Either<Failure, UserModel>> getUsername({required NoParams params});

  Future<Either<Failure, NoResponse>> deleteUsername({required NoParams params});
}