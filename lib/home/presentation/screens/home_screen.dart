import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/home/presentation/widgets/custom_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:e_commerce_app/home/presentation/bloc/product_bloc.dart';

import '../../../injection_container.dart';
import '../widgets/buttom_navigation_bar.dart';
import '../widgets/home_appbar.dart';
import '../widgets/product_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductBloc>(
      create: (_) => sl<ProductBloc>()..add(LoadAllProducts()),
      child: Scaffold(
          bottomNavigationBar: const ButtomNavBar(index: 0),
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
          ))),
    );
  }
}
