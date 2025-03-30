import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:showcase/core/navigation/application_routes.dart';
import 'package:showcase/core/resources/gaps.dart';
import 'package:showcase/features/feature_a/domain/entities/user_entity.dart';
import 'package:showcase/features/feature_a/presentation/bloc/feature_a_bloc.dart';
import 'package:showcase/features/feature_a/presentation/bloc/feature_a_event.dart';
import 'package:showcase/features/shared/common_buttons/default_common_button.dart';

class FeatureANameWidget extends StatelessWidget {
  final UserEntity user;

  const FeatureANameWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text('Hello, ${user.name}!', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 16),
            const Spacer(),
            DefaultCommonButton(
              onPressed: () => context.read<FeatureABloc>().add(DeleteNameEvent()),
              child: const Text('Delete Username'),
            ),
            Gap.h8,
            DefaultCommonButton(
              onPressed: () => context.push(ApplicationRoutes.featureC.path),
              child: const Text('Go to the next feature'),
            ),
          ],
        ),
      ),
    );
  }
}
