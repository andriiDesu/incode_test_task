import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:incode_test_task/core/navigation/route_state.dart';
import 'package:incode_test_task/modules/common/cubit/base_cubit.dart';
import 'package:incode_test_task/modules/common/view/base_layout.dart';

///[BaseScreen] handles arguments passed onto the page, and navigation
abstract class BaseScreen<S extends BaseState, C extends BaseCubit<S>, L extends BaseLayout> extends StatelessWidget {
  const BaseScreen({super.key});

  @protected
  abstract final C cubit;

  @protected
  abstract final L layout;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<C>(
      create: (_) => cubit,
      child: Builder(
        builder: (context) {
          return BlocListener<RouteCubit, RouteState>(
            bloc: context.read<C>().routeCubit,
            listener: onRoute,
            child: layout,
          );
        },
      ),
    );
  }

  @protected
  @mustCallSuper
  void onRoute(BuildContext context, RouteState state) {
    if (state is BackRouteState) {
      context.pop();
    }
  }
}
