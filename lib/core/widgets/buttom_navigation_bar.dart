import 'package:e_commerce_app/core/widgets/page_handling_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../theme/colors.dart';

class ButtomNavBar extends StatelessWidget {
  const ButtomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: (index) {
          context.read<PageHandlingCubit>().goto(index);
        },
        currentIndex: context.watch<PageHandlingCubit>().state,
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
