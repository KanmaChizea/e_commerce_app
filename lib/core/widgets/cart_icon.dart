import 'package:flutter/material.dart';

import 'appbar_container.dart';
import '../theme/colors.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: const AppBarContainer(
        child: Icon(
          Icons.shopping_cart_outlined,
          color: kGrey,
        ),
      ),
    );
  }
}
