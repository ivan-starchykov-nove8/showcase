import 'package:dartz/dartz.dart';
import 'package:showcase/core/error/failure.dart';
import 'package:showcase/core/usecase/usecase.dart';
import 'package:showcase/features/feature_b/data/datasources/remote/persistent_feature_b_datasource.dart';
import 'package:showcase/features/feature_b/domain/repositories/feature_b_repository.dart';
import 'package:showcase/features/feature_b/domain/usecases/send_analytics_usecase/send_analytics_usecase_params.dart';

class FeatureBRepositoryImpl implements FeatureBRepository {
  const FeatureBRepositoryImpl({required this.datasource});

  final RemoteFeatureBDatasource datasource;

  @override
  Future<Either<Failure, NoResponse>> sendAnalytics({required SendAnalyticsUseCaseParams params}) {
    return datasource.sendAnalytics(params: params);
  }
}
