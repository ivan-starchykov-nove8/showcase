import 'package:get_it/get_it.dart';
import 'package:showcase/features/feature_a/data/providers/persistent/persistent_feature_a_provider.dart';
import 'package:showcase/features/feature_a/data/providers/persistent/persistent_feature_a_provider_impl.dart';
import 'package:showcase/features/feature_a/data/repositories/feature_a_repository_impl.dart';
import 'package:showcase/features/feature_a/domain/repositories/feature_a_repository.dart';
import 'package:showcase/features/feature_a/domain/usecases/delete_username_usecase/delete_username_usecase.dart';
import 'package:showcase/features/feature_a/domain/usecases/get_username_usecase/get_username_usecase.dart';
import 'package:showcase/features/feature_a/domain/usecases/save_username_usecase/save_username_usecase.dart';
import 'package:showcase/features/feature_a/presentation/bloc/feature_a_bloc.dart';

final GetIt sl = GetIt.instance;

/// Sets up the service locator by registering providers, repositories, use cases, and blocs.
Future<void> setupServiceLocator() async {
  _registerProviders();
  _registerRepositories();
  _registerUseCases();
  _registerBlocs();
  await sl.allReady();
}

void _registerProviders() {
  sl.registerLazySingleton<PersistentFeatureAProvider>(
    () => PersistentFeatureAProviderImpl(),
  );
}

void _registerRepositories() {
  sl.registerLazySingleton<FeatureARepository>(
    () => FeatureARepositoryImpl(provider: sl<PersistentFeatureAProvider>()),
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
}

void _registerBlocs() {
  sl.registerLazySingleton<FeatureABloc>(
    () => FeatureABloc(
      getUsernameUseCase: sl<GetUsernameUseCase>(),
      saveUsernameUseCase: sl<SaveUsernameUseCase>(),
      deleteUsernameUseCase: sl<DeleteUsernameUseCase>(),
    ),
  );
}
