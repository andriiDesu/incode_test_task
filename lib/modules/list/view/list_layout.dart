import 'package:flutter/material.dart';
import 'package:incode_test_task/modules/common/view/base_layout.dart';
import 'package:incode_test_task/modules/list/cubit/list_cubit.dart';

class ListLayout extends BaseLayout {
  const ListLayout({super.key});

  @override
  State<StatefulWidget> createState() => _ListLayoutState();
}

class _ListLayoutState extends BaseLayoutState<ListState, ListCubit, ListLayout> {
  @override
  Widget buildLayout(BuildContext context) {
    return Container();
  }
}
