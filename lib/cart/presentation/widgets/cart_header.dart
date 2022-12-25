import 'package:flutter/material.dart';

import '../../../core/theme/colors.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      color: kSecondary1.withOpacity(0.4),
      child: Text(title,
          style: Theme.of(context).textTheme.caption?.copyWith(color: kWhite)),
    );
  }
}
