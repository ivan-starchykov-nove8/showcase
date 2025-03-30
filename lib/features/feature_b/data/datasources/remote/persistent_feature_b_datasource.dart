import 'package:dartz/dartz.dart';
import 'package:showcase/core/error/failure.dart';
import 'package:showcase/core/usecase/usecase.dart';
import 'package:showcase/features/feature_b/domain/usecases/send_analytics_usecase/send_analytics_usecase_params.dart';

abstract interface class RemoteFeatureBDatasource {
  Future<Either<Failure, NoResponse>> sendAnalytics({required SendAnalyticsUseCaseParams params});
}
