import 'package:flutter/material.dart';

import '../theme/colors.dart';
import 'cart_icon.dart';

class GeneralAppBar extends StatelessWidget {
  final String title;
  const GeneralAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline2?.copyWith(color: kBlack),
        ),
        const CartIcon()
      ],
    );
  }
}
