import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:incode_test_task/modules/main_page/view/main_screen.dart';

class RouteManager {
  RouteManager._();

  static final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

  static final _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

  static GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: MainScreen.routeName,
    debugLogDiagnostics: true,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (_, state, child) => MainScreen(
          key: state.pageKey,
          child: child,
        ),
        routes: [
          // GoRoute(
          //   path: HomeScreen.routeName,
          // builder: (_, state) => HomeScreen()
          // ),
          // GoRoute(
          //   path: ListScreen.routeName,
          // builder: (_, state) => HomeScreen()
          // ),
        ],
      ),
    ],
  );
}
