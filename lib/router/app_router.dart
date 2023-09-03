import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:stenography_training/config/app_config.dart';
import 'package:stenography_training/features/common/presentation/error_page.dart';
import 'package:stenography_training/features/main/presentation/main_page.dart';
import 'package:stenography_training/features/main/presentation/screen/main_screen.dart';

part 'app_router_state.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellRouteNavigatorKey = GlobalKey<NavigatorState>();

String href = "";

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/',
  observers: [NavigatorObserver()],
  errorPageBuilder: (context, state) =>
      appPageBuilder(const ErrorPage(pageType: ErrorPageType.notFound)),
  routes: [
    GoRoute(
      path: '/${AppRouterState.error.path}',
      name: AppRouterState.error.name,
      pageBuilder: (context, state) => appPageBuilder(
        ErrorPage(pageType: state.params['code'] as ErrorPageType),
      ),
    ),
    ShellRoute(
      navigatorKey: shellRouteNavigatorKey,
      pageBuilder: (context, state, child) {
        // screenSize = MediaQuery.of(context).size;

        return appPageBuilder(
          MainPage(child: child),
        );
      },
      routes: [
        GoRoute(
          path: '/${AppRouterState.main.path}',
          name: AppRouterState.main.name,
          pageBuilder: (context, state) => appPageBuilder(
            const MainScreen(),
          ),
        ),
      ],
    ),
  ],
);

GoRouter errorRouter(ProviderContainer providerContainer) {
  var errorPageType = ErrorPageType.notFound;

  return GoRouter(
    initialLocation: '/',
    observers: [NavigatorObserver()],
    errorPageBuilder: (context, state) => appPageBuilder(
      ErrorPage(
        pageType: errorPageType,
        isAppRunning: false,
      ),
    ),
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => appPageBuilder(ErrorPage(
          pageType: errorPageType,
          isAppRunning: false,
        )),
      ),
    ],
  );
}

Page<dynamic> appPageBuilder(Widget child) => CustomTransitionPage(
      child: child,
      transitionDuration: const Duration(milliseconds: 200),
      transitionsBuilder: (context, animation, secondAnimation, child) =>
          FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
