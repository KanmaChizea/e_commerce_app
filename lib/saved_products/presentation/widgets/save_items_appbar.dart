import 'package:flutter/material.dart';

import '../../../core/theme/colors.dart';
import '../../../core/widgets/cart_icon.dart';

class SavedItemsAppBar extends StatelessWidget {
  const SavedItemsAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Saved Items',
          style: Theme.of(context).textTheme.headline2?.copyWith(color: kBlack),
        ),
        const CartIcon()
      ],
    );
  }
}
