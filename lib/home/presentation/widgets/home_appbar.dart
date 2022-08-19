import 'package:flutter/material.dart';

import '../../../core/theme/colors.dart';
import 'appbar_container.dart';

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
        GestureDetector(
          child: const AppBarContainer(
            child: Icon(
              Icons.shopping_cart_outlined,
              color: kGrey,
            ),
          ),
        )
      ],
    );
  }
}
