import 'package:dartz/dartz.dart';
import 'package:showcase/core/error/failure.dart';
import 'package:showcase/core/usecase/usecase.dart';
import 'package:showcase/features/feature_a/data/mappers/user_mapper.dart';
import 'package:showcase/features/feature_a/data/models/user_model.dart';
import 'package:showcase/features/feature_a/data/datasources/persistent/persistent_feature_a_datasource.dart';
import 'package:showcase/features/feature_a/domain/entities/user_entity.dart';
import 'package:showcase/features/feature_a/domain/repositories/feature_a_repository.dart';
import 'package:showcase/features/feature_a/domain/usecases/save_username_usecase/save_username_usecase_params.dart';

class FeatureARepositoryImpl implements FeatureARepository {
  const FeatureARepositoryImpl({required this.datasource});

  final PersistentFeatureADatasource datasource;

  @override
  Future<Either<Failure, NoResponse>> saveUsername({required SaveUsernameUseCaseParams params}) {
    return datasource.saveUsername(params: params);
  }

  @override
  Future<Either<Failure, UserEntity>> getUsername({required NoParams params}) async {
    final Either<Failure, UserModel> response = await datasource.getUsername(params: params);
    return response.fold(
      (l) => Left(l),
      (r) => Right(r.asEntity),
    );
  }

  @override
  Future<Either<Failure, NoResponse>> deleteUsername({required NoParams params}) {
    return datasource.deleteUsername(params: params);
  }
}
