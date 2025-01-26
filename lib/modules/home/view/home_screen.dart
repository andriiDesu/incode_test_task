import 'package:flutter/material.dart';
import 'package:incode_test_task/core/navigation/route_state.dart';
import 'package:incode_test_task/modules/common/cubit/base_cubit.dart';
import 'package:incode_test_task/modules/common/view/base_layout.dart';
import 'package:incode_test_task/modules/common/view/base_screen.dart';
import 'package:incode_test_task/modules/home/cubit/home_cubit.dart';
import 'package:incode_test_task/modules/home/view/home_layout.dart';

class HomeScreen extends BaseScreen {
  const HomeScreen({super.key});

  static const routeName = '/home_screen';

  @override
  BaseLayout get layout => const HomeLayout();

  @override
  BaseCubit<BaseState> get cubit => HomeCubit();

  @override
  void onRoute(BuildContext context, RouteState state) {
    super.onRoute(context, state);
  }
}
