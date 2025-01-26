import 'package:flutter/material.dart';
import 'package:incode_test_task/modules/common/view/base_layout.dart';
import 'package:incode_test_task/modules/home/cubit/home_cubit.dart';

class HomeLayout extends BaseLayout {
  const HomeLayout({super.key});

  @override
  State<StatefulWidget> createState() => _HomeLayoutState();
}

class _HomeLayoutState
    extends BaseLayoutState<HomeState, HomeCubit, HomeLayout> {

  @override
  Widget buildLayout(BuildContext context) {
    return Container();
  }
}
