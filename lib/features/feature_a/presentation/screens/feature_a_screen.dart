import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showcase/features/feature_a/presentation/bloc/feature_a_bloc.dart';
import 'package:showcase/features/feature_a/presentation/bloc/feature_a_state.dart';
import 'package:showcase/features/feature_a/presentation/widgets/feature_a_loading_widget.dart';
import 'package:showcase/features/feature_a/presentation/widgets/feature_a_name_input_widget.dart';
import 'package:showcase/features/feature_a/presentation/widgets/feature_a_name_widget.dart';
import 'package:showcase/features/shared/screen_header/screen_header.dart';

/// Screen for Feature A that displays a greeting when a username exists,
/// or prompts the user to enter their name if none is found.
/// Also provides an option to delete the username.
class FeatureAScreen extends StatelessWidget {
  const FeatureAScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar(title: 'Feature A'),
      body: SafeArea(
        child: BlocBuilder<FeatureABloc, FeatureAState>(
          builder: (context, state) {
            return switch (state) {
              FeatureALoading() => const FeatureALoadingWidget(),
              FeatureANameState() => FeatureANameWidget(user: state.user),
              FeatureAEnterNameState() => const FeatureANameInputWidget(),
              FeatureAInitial() => SizedBox.shrink(),
            };
          },
        ),
      ),
    );
  }
}
