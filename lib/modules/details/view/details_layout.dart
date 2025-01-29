import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:incode_test_task/modules/common/view/base_layout.dart';
import 'package:incode_test_task/modules/common/view/widgets/character_image.dart';
import 'package:incode_test_task/modules/common/view/widgets/default_appbar.dart';
import 'package:incode_test_task/modules/details/cubit/details_cubit.dart';

class DetailsLayout extends BaseLayout {
  const DetailsLayout({super.key});

  @override
  State<StatefulWidget> createState() => _DetailsLayoutState();
}

class _DetailsLayoutState extends BaseLayoutState<DetailsState, DetailsCubit, DetailsLayout> {
  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(70),
      child: BlocBuilder<DetailsCubit, DetailsState>(
        builder: (_, state) {
          return DefaultAppbar(
            title: state.character?.name ?? '',
          );
        },
      ),
    );
  }

  @override
  Widget buildLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: BlocBuilder<DetailsCubit, DetailsState>(
        builder: (_, state) {
          final character = state.character;

          if (character == null) {
            return Center(child: CircularProgressIndicator());
          }

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CharacterImage(
                url: character.image,
              ),
              SizedBox(
                width: 24,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('House: ${character.house}'),
                  SizedBox(
                    height: 12,
                  ),
                  Text('Date of birth: ${character.dateOfBirth ?? ''}'),
                  SizedBox(
                    height: 12,
                  ),
                  Text('Actor: ${character.actor}'),
                  SizedBox(
                    height: 12,
                  ),
                  Text('Species: ${character.species}'),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
