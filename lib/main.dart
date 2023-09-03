// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:stenography_training/config/app_config.dart';
import 'package:stenography_training/router/app_router.dart';
import 'package:stenography_training/stenography_training_app.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  final container = ProviderContainer();

  WidgetsFlutterBinding.ensureInitialized();

  usePathUrlStrategy();

  await initializedApp();

  FlutterNativeSplash.remove();

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: StenographyTrainingApp(
        router: router,
      ),
    ),
  );
}
