import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:incode_test_task/modules/common/view/base_layout.dart';
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
    return AppBar(
      title: Text('Home Screen'),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 70,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 24),
          child: GestureDetector(
            onTap: cubit.resetGuesses,
            child: Text('Reset'),
          ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(1),
        child: Divider(
          color: Colors.black,
        ),
      ),
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
                    Image.network(
                      state.character!.image,
                      errorBuilder: (_, __, ___) => _loadingImageBuilder(),
                      loadingBuilder: (_, __, ___) => _loadingImageBuilder(),
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

  Widget _loadingImageBuilder() {
    return Container(
      height: 200,
      alignment: Alignment.center,
      child: Text(
        'No image available',
      ),
    );
  }
}
