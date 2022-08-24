import 'package:flutter/material.dart';

import '../../../core/theme/colors.dart';
import '../../../core/widgets/cart_icon.dart';
import '../../../core/widgets/appbar_container.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
            child: AppBarContainer(
                child: Row(
          children: [
            const Icon(Icons.search, color: kGrey),
            const SizedBox(width: 12),
            Text(
              'Find your product',
              style:
                  Theme.of(context).textTheme.bodyText2?.copyWith(color: kGrey),
            )
          ],
        ))),
        const SizedBox(width: 16),
        const CartIcon()
      ],
    );
  }
}
