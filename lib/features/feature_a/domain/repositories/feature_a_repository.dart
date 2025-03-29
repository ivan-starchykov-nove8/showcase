import 'package:dartz/dartz.dart';
import 'package:showcase/core/error/failure.dart';
import 'package:showcase/core/usecase/usecase.dart';
import 'package:showcase/features/feature_a/domain/entities/user_entity.dart';
import 'package:showcase/features/feature_a/domain/usecases/save_username_usecase/save_username_usecase_params.dart';

abstract interface class FeatureARepository {
  Future<Either<Failure, NoResponse>> saveUsername({required SaveUsernameUseCaseParams params});

  Future<Either<Failure, UserEntity>> getUsername({required NoParams params});

  Future<Either<Failure, NoResponse>> deleteUsername({required NoParams params});
}
