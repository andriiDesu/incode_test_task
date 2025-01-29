import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:incode_test_task/core/extensions/build_context_extension.dart';
import 'package:incode_test_task/modules/common/view/base_layout.dart';
import 'package:incode_test_task/modules/common/view/widgets/character_image.dart';
import 'package:incode_test_task/modules/common/view/widgets/default_appbar.dart';
import 'package:incode_test_task/modules/common/view/widgets/guesses_block.dart';
import 'package:incode_test_task/modules/home/cubit/home_cubit.dart';
import 'package:incode_test_task/modules/home/view/widget/house_guess_input.dart';
import 'package:incode_test_task/resources/styles.dart';

class HomeLayout extends BaseLayout {
  const HomeLayout({super.key});

  @override
  State<StatefulWidget> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends BaseLayoutState<HomeState, HomeCubit, HomeLayout> {
  @override
  HomeCubit get cubit => context.read<HomeCubit>();

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return DefaultAppbar(
      resetGuesses: cubit.resetGuesses,
      title: context.strings.homeScreen,
    );
  }

  @override
  Widget buildLayout(BuildContext context) {
    return RefreshIndicator(
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
      onRefresh: cubit.getCharacter,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        children: [
          BlocBuilder<HomeCubit, HomeState>(
            buildWhen: (previous, next) => previous.guesses != next.guesses,
            builder: (_, state) => GuessesBlock(guesses: state.guesses),
          ),
          BlocBuilder<HomeCubit, HomeState>(
            buildWhen: (previous, next) => previous.character != next.character,
            builder: (_, state) {
              if (state.character == null) {
                return Container(
                  height: 277,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                );
              }

              return Container(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(state.character!.house),
                    CharacterImage(
                      loaderHeight: 200,
                      url: state.character!.image,
                    ),
                    Text(
                      state.character!.name,
                      style: Styles.characterName,
                    ),
                  ],
                ),
              );
            },
          ),
          HouseGuessInput(),
        ],
      ),
    );
  }
}
