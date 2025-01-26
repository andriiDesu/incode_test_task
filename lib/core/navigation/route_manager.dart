import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouteManager {
  RouteManager._();

  static final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

  static GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [],
  );
}
