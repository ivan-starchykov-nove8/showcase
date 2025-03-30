import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showcase/features/feature_b/domain/usecases/send_analytics_usecase/send_analytics_usecase.dart';
import 'package:showcase/features/feature_b/domain/usecases/send_analytics_usecase/send_analytics_usecase_params.dart';

import 'feature_b_event.dart';
import 'feature_b_state.dart';

class FeatureBBloc extends Bloc<FeatureBEvent, FeatureBState> {
  FeatureBBloc({
    required SendAnalyticsUseCase sendAnalyticsUseCase,
  })  : _sendAnalyticsUseCase = sendAnalyticsUseCase,
        super(const FeatureBInitial()) {
    on<StepOneNumberSelected>(_onStepOneNumberSelected);
    on<StepTwoNumberSelected>(_onStepTwoNumberSelected);
    on<SendAnalyticsEvent>(_sendAnalyticsEvent);
  }

  final SendAnalyticsUseCase _sendAnalyticsUseCase;

  void _onStepOneNumberSelected(StepOneNumberSelected event, Emitter<FeatureBState> emit) {
    emit(FeatureBStepOneCompleted(event.number));
  }

  void _onStepTwoNumberSelected(StepTwoNumberSelected event, Emitter<FeatureBState> emit) {
    final FeatureBState currentState = state;
    if (currentState is FeatureBStepOneCompleted) {
      emit(FeatureBStepTwoCompleted(currentState.stepOneNumber, event.number));
    } else if (currentState is FeatureBStepTwoCompleted) {
      emit(FeatureBStepTwoCompleted(currentState.stepOneNumber, event.number));
    }
  }

  Future<void> _sendAnalyticsEvent(SendAnalyticsEvent event, Emitter<FeatureBState> emit) async {
    final SendAnalyticsUseCaseParams params = SendAnalyticsUseCaseParams(
      eventName: 'FeatureBCompleted',
      properties: {
        'stepOne': event.stepOne,
        'stepTwo': event.stepTwo,
        'sum': event.stepOne + event.stepTwo,
      },
    );
    await _sendAnalyticsUseCase.call(params);
  }
}
