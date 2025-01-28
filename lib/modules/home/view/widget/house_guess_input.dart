import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:incode_test_task/domain/enums/house_enum.dart';
import 'package:incode_test_task/modules/home/cubit/home_cubit.dart';
import 'package:incode_test_task/resources/gen/assets.gen.dart';
import 'package:incode_test_task/resources/styles.dart';

class HouseGuessInput extends StatelessWidget {
  const HouseGuessInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _HouseButton(
              asset: Assets.images.gryffindor.path,
              house: HouseEnum.Gryffindor,
            ),
            SizedBox(
              width: 16,
            ),
            _HouseButton(
              asset: Assets.images.slytherin.path,
              house: HouseEnum.Slytherin,
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          children: [
            _HouseButton(
              asset: Assets.images.ravenclaw.path,
              house: HouseEnum.Ravenclaw,
            ),
            SizedBox(
              width: 16,
            ),
            _HouseButton(
              asset: Assets.images.hufflepuff.path,
              house: HouseEnum.Hufflepuff,
            ),
          ],
        ),
        GestureDetector(
          onTap: () => context.read<HomeCubit>().guessAffiliation(HouseEnum.none),
          child: Container(
            width: double.infinity,
            height: 70,
            margin: EdgeInsets.only(top: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: Colors.grey.shade100,
            ),
            alignment: Alignment.center,
            child: Text(
              'Not in house',
              style: Styles.guessType,
            ),
          ),
        ),
      ],
    );
  }
}

class _HouseButton extends StatelessWidget {
  const _HouseButton({
    required this.asset,
    required this.house,
  });

  final String asset;
  final HouseEnum house;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => context.read<HomeCubit>().guessAffiliation(house),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: Colors.grey.shade100,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                asset,
                height: 24,
                width: 24,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                house.name,
                style: Styles.houseTitle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
