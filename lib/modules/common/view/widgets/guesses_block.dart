import 'package:flutter/material.dart';
import 'package:incode_test_task/domain/enums/guess_type_enum.dart';
import 'package:incode_test_task/modules/home/models/guesses_ui.dart';
import 'package:incode_test_task/resources/styles.dart';

class GuessesBlock extends StatelessWidget {
  const GuessesBlock({
    required this.guesses,
    super.key,
  });

  final GuessesUi guesses;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _GuessContainer(
          guessType: GuessTypeEnum.Total,
          guessNumber: guesses.guesses.length,
        ),
        _GuessContainer(
          guessType: GuessTypeEnum.Success,
          guessNumber: guesses.successCount,
        ),
        _GuessContainer(
          guessType: GuessTypeEnum.Failed,
          guessNumber: guesses.failureCount,
        ),
      ],
    );
  }
}

class _GuessContainer extends StatelessWidget {
  const _GuessContainer({
    required this.guessType,
    required this.guessNumber,
  });

  final GuessTypeEnum guessType;
  final int guessNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 100,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: Colors.grey.shade100,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$guessNumber',
            style: Styles.guessNumber,
          ),
          SizedBox(height: 8,),
          Text(
            guessType.name,
            style: Styles.guessType,
          ),
        ],
      ),
    );
  }
}
