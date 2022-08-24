import '../../../core/constants.dart';
import '../widgets/custom_tabbar.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/buttom_navigation_bar.dart';
import '../widgets/home_appbar.dart';
import '../widgets/product_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const ButtomNavBar(),
        body: SafeArea(
            child: Padding(
          padding: kPadding,
          child: Column(
            children: [
              const HomeAppBar(),
              const SizedBox(height: 24),
              const SizedBox(height: 50, child: CustomTabBar()),
              const SizedBox(height: 24),
              Builder(builder: (context) {
                return const ProductsBody();
              })
            ],
          ),
        )));
  }
}
