import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:incode_test_task/core/extensions/build_context_extension.dart';
import 'package:incode_test_task/modules/common/view/base_layout.dart';
import 'package:incode_test_task/modules/common/view/widgets/default_appbar.dart';
import 'package:incode_test_task/modules/common/view/widgets/guesses_block.dart';
import 'package:incode_test_task/modules/list/cubit/list_cubit.dart';
import 'package:incode_test_task/modules/list/view/widgets/guess_tile.dart';

class ListLayout extends BaseLayout {
  const ListLayout({super.key});

  @override
  State<StatefulWidget> createState() => _ListLayoutState();
}

class _ListLayoutState extends BaseLayoutState<ListState, ListCubit, ListLayout> {
  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return DefaultAppbar(
      resetGuesses: cubit.resetGuesses,
      title: context.strings.listScreen,
    );
  }

  @override
  Widget buildLayout(BuildContext context) {
    return BlocBuilder<ListCubit, ListState>(builder: (_, state) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          children: [
            GuessesBlock(guesses: state.guesses),
            SizedBox(
              height: 32,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: state.guesses.guesses.length,
                itemBuilder: (_, index) {
                  final character = state.guesses.guesses[index];

                  return GuessTile(
                    character: character,
                    onTap: () => cubit.navigateToDetails(character: character),
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
