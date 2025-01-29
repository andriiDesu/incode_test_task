import 'package:flutter/material.dart';
import 'package:incode_test_task/core/extensions/build_context_extension.dart';

class DefaultAppbar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppbar({
    required this.title,
    this.resetGuesses,
    this.onBackPressed,
    super.key,
  });

  final VoidCallback? resetGuesses;
  final String title;
  final VoidCallback? onBackPressed;

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;

    return AppBar(
      title: Text(title),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: onBackPressed != null
          ? GestureDetector(
              onTap: onBackPressed,
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 12,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text('Back'),
                ],
              ),
            )
          : null,
      actions: [
        if (resetGuesses != null)
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: GestureDetector(
              onTap: resetGuesses,
              child: Text(strings.reset),
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
  Size get preferredSize => Size.fromHeight(70);
}
