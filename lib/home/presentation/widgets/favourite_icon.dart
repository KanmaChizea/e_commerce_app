import 'package:flutter/material.dart';

import '../../../core/theme/colors.dart';

class FavouriteIcon extends StatelessWidget {
  const FavouriteIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration:
          const BoxDecoration(color: kSecondary3, shape: BoxShape.circle),
      child: const Icon(
        Icons.favorite_border,
        color: kRed,
        size: 20,
      ),
    );
  }
}
