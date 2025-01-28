import 'package:flutter/material.dart';
import 'package:incode_test_task/core/di/dependency_provider.dart';
import 'package:incode_test_task/core/navigation/route_state.dart';
import 'package:incode_test_task/modules/common/view/base_screen.dart';
import 'package:incode_test_task/modules/list/cubit/list_cubit.dart';
import 'package:incode_test_task/modules/list/view/list_layout.dart';

class ListScreen extends BaseScreen<ListState, ListCubit, ListLayout> {
  const ListScreen({super.key});

  static const routeName = '/List_screen';

  @override
  ListLayout get layout => const ListLayout();

  @override
  ListCubit get cubit => ListCubit(get());

  @override
  void onRoute(BuildContext context, RouteState state) {
    super.onRoute(context, state);
  }
}
