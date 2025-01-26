import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:incode_test_task/modules/common/view/base_layout.dart';
import 'package:incode_test_task/modules/main_page/cubit/main_cubit.dart';
import 'package:incode_test_task/modules/main_page/view/widgets/main_bottom_nav_bar.dart';

class MainLayout extends BaseLayout {
  const MainLayout({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<StatefulWidget> createState() => _MainLayoutState();
}

class _MainLayoutState extends BaseLayoutState<MainState, MainCubit, MainLayout> {
  @override
  Widget buildLayout(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (_, state) {
        return Scaffold(
          body: widget.child,
          bottomNavigationBar: MainBottomNavBar(
            onTapItem: cubit.onPageChanged,
            currentIndex: state.currentIndex,
          ),
        );
      },
    );
  }
}
