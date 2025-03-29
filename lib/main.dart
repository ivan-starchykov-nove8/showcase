import 'package:flutter/material.dart';
import 'package:showcase/core/screen_factory/screen_factory.dart';
import 'package:showcase/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(ScreenFactory.renderApplication());
}
