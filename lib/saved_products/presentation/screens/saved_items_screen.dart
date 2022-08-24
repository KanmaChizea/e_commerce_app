import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/widgets/buttom_navigation_bar.dart';
import 'package:e_commerce_app/home/presentation/bloc/product_bloc.dart';
import 'package:e_commerce_app/saved_products/presentation/cubit/saved_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/save_items_appbar.dart';
import '../widgets/saved_item_card.dart';
import '../widgets/saved_items_body.dart';

class SavedItemsScreen extends StatelessWidget {
  const SavedItemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final savedItems = context.watch<SavedProductCubit>().state;
    return Scaffold(
        bottomNavigationBar: const ButtomNavBar(),
        body: SafeArea(
            child: Padding(
                padding: kPadding.copyWith(bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SavedItemsAppBar(),
                    const SizedBox(height: 24),
                    if (savedItems.isNotEmpty)
                      TextButton.icon(
                          onPressed: () => context
                              .read<SavedProductCubit>()
                              .clearAllSavedProduct(),
                          icon: const Icon(Icons.delete_outline),
                          label: const Text(
                            'Clear all',
                          )),
                    const SizedBox(height: 8),
                    SavedItemsBody(savedItems: savedItems)
                  ],
                ))));
  }
}
