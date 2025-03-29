import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showcase/features/feature_a/presentation/bloc/feature_a_bloc.dart';
import 'package:showcase/features/feature_a/presentation/bloc/feature_a_event.dart';
import 'package:showcase/features/feature_a/presentation/bloc/feature_a_state.dart';

/// Screen for Feature A that displays a greeting when a username exists,
/// or prompts the user to enter their name if none is found.
/// Also provides an option to delete the username.
class FeatureAScreen extends StatelessWidget {
  const FeatureAScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feature A'),
      ),
      body: BlocBuilder<FeatureABloc, FeatureAState>(
        builder: (context, state) {
          if (state is FeatureALoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FeatureANameState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Hello, ${state.user.name}!'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => context.read<FeatureABloc>().add(DeleteNameEvent()),
                    child: const Text('Delete Username'),
                  ),
                ],
              ),
            );
          } else if (state is FeatureAEnterNameState) {
            return const _NameInputForm();
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

/// Form allowing the user to enter their username.
class _NameInputForm extends StatefulWidget {
  const _NameInputForm({Key? key}) : super(key: key);

  @override
  State<_NameInputForm> createState() => _NameInputFormState();
}

class _NameInputFormState extends State<_NameInputForm> {
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
        children: [
          const Text('Please enter your name:'),
          TextField(
            controller: _controller,
            decoration: const InputDecoration(hintText: 'Enter name'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _submitName,
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
