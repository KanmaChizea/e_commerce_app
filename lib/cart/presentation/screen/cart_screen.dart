import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:e_commerce_app/cart/domain/entity/cart_entity.dart';
import 'package:e_commerce_app/core/constants.dart';

import '../../../core/theme/buttons.dart';
import '../../../core/theme/colors.dart';
import '../bloc/cart_bloc.dart';
import '../widgets/cart_header.dart';
import '../widgets/cart_item_tile.dart';
import '../widgets/suntotal.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: kBlack,
          title: Text('Cart',
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  ?.copyWith(color: kBlack)),
        ),
        body:
            BlocBuilder<CartBloc, List<CartEntity>>(builder: (context, state) {
          if (state.isEmpty) {
            return const Center(child: Text('Your cart is empty'));
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                const CartHeader(title: 'CART SUMMARY'),
                Padding(
                    padding: kPadding,
                    child: Column(children: [
                      const SubTotal(),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.length,
                          itemBuilder: (context, index) {
                            final item = state[index];
                            return CartItemTile(item: item);
                          }),
                      const SizedBox(height: 40),
                      ElevatedButton(
                          onPressed: () =>
                              Navigator.of(context).pushNamed('checkout'),
                          style: fullButton.copyWith(
                              minimumSize: MaterialStateProperty.all(
                                  Size(MediaQuery.of(context).size.width, 48))),
                          child: Text('Checkout',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  ?.copyWith(color: kWhite)))
                    ]))
              ],
            ),
          );
        }));
  }
}
