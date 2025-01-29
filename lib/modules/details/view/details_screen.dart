import 'package:flutter/material.dart';
import 'package:incode_test_task/core/navigation/route_state.dart';
import 'package:incode_test_task/modules/common/view/base_screen.dart';
import 'package:incode_test_task/modules/details/cubit/details_cubit.dart';
import 'package:incode_test_task/modules/details/view/details_layout.dart';
import 'package:incode_test_task/modules/home/models/character_ui.dart';

class DetailsScreen extends BaseScreen<DetailsState, DetailsCubit, DetailsLayout> {
  const DetailsScreen({
    required this.arguments,
    super.key,
  });

  final DetailsScreenArguments arguments;

  static const routeName = '/Details_screen';

  @override
  DetailsLayout get layout => const DetailsLayout();

  @override
  void onRoute(BuildContext context, RouteState state) {
    super.onRoute(context, state);
  }

  @override
  DetailsCubit get cubit => DetailsCubit(arguments.character);
}

class DetailsScreenArguments {
  DetailsScreenArguments({
    required this.character,
  });

  final CharacterUi character;
}
