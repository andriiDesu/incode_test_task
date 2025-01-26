import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:incode_test_task/core/extensions/build_context_extension.dart';
import 'package:incode_test_task/modules/common/cubit/base_cubit.dart';

abstract class BaseLayout extends StatefulWidget {
  const BaseLayout({super.key});
}

///[BaseLayout] handles page layout and errors
///
///Completely redundant, but I am used to working with this particular architecture, so I will use it anyway, albeit
///simplified
abstract class BaseLayoutState<S extends BaseState, C extends BaseCubit<S>, L extends BaseLayout> extends State<L> {
  @protected
  late final C cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<C>();
    WidgetsBinding.instance.addPostFrameCallback((_) => onInit());
  }

  @protected
  void onInit() {}

  @override
  Widget build(BuildContext context) {
    return BlocListener<ErrorCubit, ErrorState>(
      bloc: cubit.errorCubit,
      listener: (_, state) {
        if (state.error != null) {
          handleError(state.error!, state.retry);
        }
      },
      child: BlocBuilder<ProgressCubit, bool>(
        bloc: cubit.progressCubit,
        builder: (_, inProgress) => Stack(
          children: [
            PopScope(
              canPop: inProgress,
              child: GestureDetector(
                onTap: () => context.clearFocus(),
                child: Scaffold(
                  appBar: buildAppBar(context),
                  backgroundColor: Colors.white,
                  body: SafeArea(child: buildLayout(context)),
                ),
              ),
            ),
            if(inProgress) CircularProgressIndicator(
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }

  @protected
  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  @protected
  Widget buildLayout(BuildContext context);

  @protected
  void handleError(ExecutionError error, void Function() retry) {
    final strings = context.strings;
    ///Room for proper error handling
    showGeneralBottomSheet(retry, message: strings.somethingWentWrong);
  }

  Future<void> showGeneralBottomSheet(
      void Function() retry, {
        String? message,
        bool isDismissible = true,
        Widget? child,
      }) {
    ///Placeholder Text widget, replace with any default page
    return context.showGeneralBottomSheet<void>(
      child: child ?? Text(message ?? '')
    );
  }
}
