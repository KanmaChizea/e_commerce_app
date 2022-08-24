import 'dart:developer';

import 'package:e_commerce_app/saved_products/presentation/widgets/saved_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/presentation/bloc/product_bloc.dart';

class SavedItemsBody extends StatelessWidget {
  const SavedItemsBody({
    Key? key,
    required this.savedItems,
  }) : super(key: key);

  final List savedItems;

  @override
  Widget build(BuildContext context) {
    log(savedItems.length.toString());
    if (savedItems.isEmpty) {
      return const Expanded(
          child: Center(
        child: Text('You have nothing saved'),
      ));
    }
    return BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
      if (state is ProductLoaded) {
        return Expanded(
            child: ListView.builder(
                itemCount: savedItems.length,
                itemBuilder: (context, index) {
                  final savedProducts = state.productList
                      .where((product) => savedItems.contains(product.id))
                      .toList();
                  return SavedItemCard(savedProducts: savedProducts[index]);
                }));
      } else if (state is ProductFailed) {
        return Expanded(child: Center(child: Text(state.failure.message)));
      } else {
        return const Expanded(
            child: Center(child: CircularProgressIndicator()));
      }
    });
  }
}
