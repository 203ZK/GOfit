import 'package:flutter/material.dart';

class TrainerNavigationBar extends StatelessWidget {
  const TrainerNavigationBar({
    super.key,
    this.selectedIndex = 0,
    required this.onChangeNavigation,
  });

  final int selectedIndex;
  final void Function(int) onChangeNavigation;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'My Profile',
        ),
      ],
      currentIndex: selectedIndex,
      onTap: onChangeNavigation,
    );
  }
}
