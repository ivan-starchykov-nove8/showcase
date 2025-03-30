import 'package:get_it/get_it.dart';
import 'package:showcase/features/feature_a/data/datasources/persistent/persistent_feature_a_datasource.dart';
import 'package:showcase/features/feature_a/data/datasources/persistent/persistent_feature_a_datasource_impl.dart';
import 'package:showcase/features/feature_a/data/repositories/feature_a_repository_impl.dart';
import 'package:showcase/features/feature_a/domain/repositories/feature_a_repository.dart';
import 'package:showcase/features/feature_a/domain/usecases/delete_username_usecase/delete_username_usecase.dart';
import 'package:showcase/features/feature_a/domain/usecases/get_username_usecase/get_username_usecase.dart';
import 'package:showcase/features/feature_a/domain/usecases/save_username_usecase/save_username_usecase.dart';
import 'package:showcase/features/feature_a/presentation/bloc/feature_a_bloc.dart';
import 'package:showcase/features/feature_b/data/datasources/remote/persistent_feature_b_datasource.dart';
import 'package:showcase/features/feature_b/data/datasources/remote/persistent_feature_b_datasource_impl.dart';
import 'package:showcase/features/feature_b/data/repositories/feature_b_repository_impl.dart';
import 'package:showcase/features/feature_b/domain/repositories/feature_b_repository.dart';
import 'package:showcase/features/feature_b/domain/usecases/send_analytics_usecase/send_analytics_usecase.dart';
import 'package:showcase/features/feature_b/presentation/bloc/feature_b_bloc.dart';

final GetIt sl = GetIt.instance;

/// Sets up the service locator by registering datasources, repositories, use cases, and blocs.
Future<void> setupServiceLocator() async {
  _registerProviders();
  _registerRepositories();
  _registerUseCases();
  _registerBlocs();
  await sl.allReady();
}

void _registerProviders() {
  sl.registerLazySingleton<PersistentFeatureADatasource>(
    () => PersistentFeatureAProviderImpl(),
  );
  sl.registerLazySingleton<RemoteFeatureBDatasource>(
    () => RemoteFeatureBDatasourceImpl(),
  );
}

void _registerRepositories() {
  sl.registerLazySingleton<FeatureARepository>(
    () => FeatureARepositoryImpl(datasource: sl<PersistentFeatureADatasource>()),
  );
  sl.registerLazySingleton<FeatureBRepository>(
    () => FeatureBRepositoryImpl(datasource: sl<RemoteFeatureBDatasource>()),
  );
}

void _registerUseCases() {
  sl.registerLazySingleton<SaveUsernameUseCase>(
    () => SaveUsernameUseCase(repository: sl<FeatureARepository>()),
  );
  sl.registerLazySingleton<GetUsernameUseCase>(
    () => GetUsernameUseCase(repository: sl<FeatureARepository>()),
  );
  sl.registerLazySingleton<DeleteUsernameUseCase>(
    () => DeleteUsernameUseCase(repository: sl<FeatureARepository>()),
  );
  sl.registerLazySingleton<SendAnalyticsUseCase>(
    () => SendAnalyticsUseCase(repository: sl<FeatureBRepository>()),
  );
}

void _registerBlocs() {
  sl.registerLazySingleton<FeatureABloc>(
    () => FeatureABloc(
      getUsernameUseCase: sl<GetUsernameUseCase>(),
      saveUsernameUseCase: sl<SaveUsernameUseCase>(),
      deleteUsernameUseCase: sl<DeleteUsernameUseCase>(),
    ),
  );

  sl.registerLazySingleton<FeatureBBloc>(
    () => FeatureBBloc(
      sendAnalyticsUseCase: sl(),
    ),
  );
}
