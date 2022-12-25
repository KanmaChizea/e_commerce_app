import 'package:e_commerce_app/cart/domain/entity/cart_entity.dart';
import 'package:e_commerce_app/cart/presentation/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'appbar_container.dart';
import '../theme/colors.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<CartBloc>().add(GetCart());
        Navigator.pushNamed(context, 'cart');
      },
      child:
          //  Stack(
          //   children: [
          const AppBarContainer(
        child: Icon(
          Icons.shopping_cart_outlined,
          color: kGrey,
        ),
      ),
      // BlocBuilder<CartBloc, List<CartEntity>>(builder: (context, state) {
      //   var count = 0;
      //   for (var cartEntity in state) {
      //     count = count + cartEntity.quantity;
      //   }
      //   return count != 0
      //       ? Positioned(
      //           right: 0,
      //           top: 0,
      //           child: Container(
      //               padding: const EdgeInsets.all(8),
      //               decoration: const BoxDecoration(
      //                   shape: BoxShape.circle, color: Colors.red),
      //               child: Text(count.toString(),
      //                   style: Theme.of(context).textTheme.bodyText2)),
      //         )
      //       : Container();
      // })
      //   ],
      // ),
    );
  }
}
