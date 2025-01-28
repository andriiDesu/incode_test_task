import 'package:flutter/material.dart';
import 'package:incode_test_task/core/extensions/build_context_extension.dart';
import 'package:incode_test_task/resources/styles.dart';

class MainBottomNavBar extends StatelessWidget {
  const MainBottomNavBar({
    required this.onTapItem,
    required this.currentIndex,
    super.key,
  });

  final ValueChanged<int> onTapItem;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.black),
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTapItem,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: Styles.selectedNavBar,
        unselectedLabelStyle: Styles.unselectedNavBar,
        items: [
          BottomNavigationBarItem(
            activeIcon: _ItemIcon(Icons.home),
            icon: _ItemIcon(Icons.home_outlined),
            label: strings.home,
          ),
          BottomNavigationBarItem(
            activeIcon: _ItemIcon(Icons.view_list),
            icon: _ItemIcon(Icons.view_list_outlined),
            label: strings.list,
          ),
        ],
      ),
    );
  }
}

class _ItemIcon extends StatelessWidget {
  const _ItemIcon(this.icon);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Icon(
        icon,
        size: 24,
      ),
    );
  }
}
