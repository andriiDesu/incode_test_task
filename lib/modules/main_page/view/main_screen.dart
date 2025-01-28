import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:incode_test_task/core/navigation/route_state.dart';
import 'package:incode_test_task/modules/common/view/base_screen.dart';
import 'package:incode_test_task/modules/home/view/home_screen.dart';
import 'package:incode_test_task/modules/list/view/list_screen.dart';
import 'package:incode_test_task/modules/main_page/cubit/main_cubit.dart';
import 'package:incode_test_task/modules/main_page/view/main_layout.dart';

class MainScreen extends BaseScreen<MainState, MainCubit, MainLayout> {
  const MainScreen({
    required this.child,
    super.key,
  });

  final Widget child;

  static const routeName = '/';

  @override
  MainCubit get cubit => MainCubit();

  @override
  MainLayout get layout => MainLayout(child: child);

  @override
  void onRoute(BuildContext context, RouteState state) {
    if (state is HomeRouteState) {
      context.go(HomeScreen.routeName);
    } else if (state is ListRouteState) {
      context.go(ListScreen.routeName);
    } else {
      super.onRoute(context, state);
    }
  }
}
