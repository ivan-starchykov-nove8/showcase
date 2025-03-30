import 'package:dartz/dartz.dart';
import 'package:showcase/core/error/failure.dart';
import 'package:showcase/core/usecase/usecase.dart';
import 'package:showcase/features/feature_b/domain/repositories/feature_b_repository.dart';
import 'send_analytics_usecase_params.dart';

final class SendAnalyticsUseCase implements UseCase<NoResponse, SendAnalyticsUseCaseParams> {
  const SendAnalyticsUseCase({required this.repository});

  final FeatureBRepository repository;

  @override
  Future<Either<Failure, NoResponse>> call(SendAnalyticsUseCaseParams params) {
    return repository.sendAnalytics(params: params);
  }
}
