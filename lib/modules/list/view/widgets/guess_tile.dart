import 'package:flutter/material.dart';
import 'package:incode_test_task/modules/common/view/widgets/character_image.dart';
import 'package:incode_test_task/modules/home/models/character_ui.dart';

class GuessTile extends StatelessWidget {
  const GuessTile({
    required this.character,
    required this.onTap,
    super.key,
  });

  final CharacterUi character;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          CharacterImage(
            url: character.image,
            loaderHeight: 50,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            character.name,
          ),
          Spacer(),
          Icon(
            character.isSuccess ? Icons.check : Icons.close,
            size: 32,
            color: character.isSuccess ? Colors.green : Colors.red,
          ),
        ],
      ),
    );
  }
}
