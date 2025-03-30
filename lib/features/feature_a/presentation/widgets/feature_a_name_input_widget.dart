import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showcase/features/feature_a/presentation/bloc/feature_a_bloc.dart';
import 'package:showcase/features/feature_a/presentation/bloc/feature_a_event.dart';
import 'package:showcase/features/shared/common_buttons/default_common_button.dart';

/// Form allowing the user to enter their username.
class FeatureANameInputWidget extends StatefulWidget {
  const FeatureANameInputWidget({super.key});

  @override
  State<FeatureANameInputWidget> createState() => _FeatureANameInputWidgetState();
}

class _FeatureANameInputWidgetState extends State<FeatureANameInputWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submitName() {
    final name = _controller.text.trim();
    if (name.isNotEmpty) {
      context.read<FeatureABloc>().add(SubmitNameEvent(name));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          const Text('Please enter your name:'),
          TextField(
            controller: _controller,
            decoration: const InputDecoration(hintText: 'Enter name'),
          ),
          Spacer(),
          DefaultCommonButton(
            onPressed: _submitName,
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
