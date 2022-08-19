import 'package:flutter/material.dart';

import 'package:e_commerce_app/core/theme/colors.dart';

class ButtomNavBar extends StatelessWidget {
  const ButtomNavBar({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: (_) {
          if (index == 0) {
          } else {}
        },
        currentIndex: index,
        iconSize: 32,
        selectedItemColor: kPrimary,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline), label: 'Saved'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Account'),
        ]);
  }
}
