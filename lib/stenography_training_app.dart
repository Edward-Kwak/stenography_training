import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:stenography_training/features/main/presentation/controller/main_screen_size_controller.dart';
import 'package:stenography_training/resources/resources.dart';

class StenographyTrainingApp extends StatelessWidget {
  const StenographyTrainingApp({
    super.key,
    required this.router,
  });

  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        Future.microtask(() {
          ref.read(mainScreenSizeProvider.notifier).state =
              MediaQuery.of(context).size;
        });

        return child!;
      },
      child: MaterialApp.router(
        theme: AppThemes.appTheme,
        title: '속기 연습 페이지',
        debugShowCheckedModeBanner: false,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        routerDelegate: router.routerDelegate,
      ),
    );
  }
}
