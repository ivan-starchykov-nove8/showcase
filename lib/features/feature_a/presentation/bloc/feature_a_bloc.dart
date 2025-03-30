import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showcase/core/error/failure.dart';
import 'package:showcase/core/usecase/usecase.dart';
import 'package:showcase/features/feature_a/domain/entities/user_entity.dart';
import 'package:showcase/features/feature_a/domain/usecases/delete_username_usecase/delete_username_usecase.dart';
import 'package:showcase/features/feature_a/domain/usecases/get_username_usecase/get_username_usecase.dart';
import 'package:showcase/features/feature_a/domain/usecases/save_username_usecase/save_username_usecase.dart';
import 'package:showcase/features/feature_a/domain/usecases/save_username_usecase/save_username_usecase_params.dart';
import 'feature_a_event.dart';
import 'feature_a_state.dart';

/// BLoC for Feature A integrating the get, save, and delete use cases.
class FeatureABloc extends Bloc<FeatureAEvent, FeatureAState> {
  FeatureABloc({
    required GetUsernameUseCase getUsernameUseCase,
    required SaveUsernameUseCase saveUsernameUseCase,
    required DeleteUsernameUseCase deleteUsernameUseCase,
  })  : _getUsernameUseCase = getUsernameUseCase,
        _saveUsernameUseCase = saveUsernameUseCase,
        _deleteUsernameUseCase = deleteUsernameUseCase,
        super(FeatureAInitial()) {
    on<LoadNameEvent>(_onLoadName);
    on<SubmitNameEvent>(_onSubmitName);
    on<DeleteNameEvent>(_onDeleteName);

    add(LoadNameEvent());
  }

  final GetUsernameUseCase _getUsernameUseCase;
  final SaveUsernameUseCase _saveUsernameUseCase;
  final DeleteUsernameUseCase _deleteUsernameUseCase;

  Future<void> _onLoadName(LoadNameEvent event, Emitter<FeatureAState> emit) async {
    if (state is! FeatureALoading) emit(FeatureALoading());
    final Either<Failure, UserEntity> result = await _getUsernameUseCase.call(NoParams());
    result.fold(
      (l) => emit(const FeatureAEnterNameState()),
      (r) => r.name.isNotEmpty ? emit(FeatureANameState(r)) : emit(const FeatureAEnterNameState()),
    );
  }

  Future<void> _onSubmitName(SubmitNameEvent event, Emitter<FeatureAState> emit) async {
    if (state is! FeatureALoading) emit(FeatureALoading());
    final SaveUsernameUseCaseParams params = SaveUsernameUseCaseParams(name: event.name);
    final Either<Failure, NoResponse> result = await _saveUsernameUseCase.call(params);
    result.fold(
      (l) => emit(const FeatureAEnterNameState()),
      (r) => add(LoadNameEvent()),
    );
  }

  Future<void> _onDeleteName(DeleteNameEvent event, Emitter<FeatureAState> emit) async {
    if (state is! FeatureALoading) emit(FeatureALoading());
    final Either<Failure, NoResponse> result = await _deleteUsernameUseCase.call(NoParams());
    result.fold(
      (l) => emit(state),
      (r) => emit(const FeatureAEnterNameState()),
    );
  }
}
