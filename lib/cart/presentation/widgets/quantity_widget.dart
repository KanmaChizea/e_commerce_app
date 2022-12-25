import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/colors.dart';
import '../../domain/entity/cart_entity.dart';
import '../bloc/cart_bloc.dart';

class QuantityWidget extends StatelessWidget {
  const QuantityWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final CartEntity item;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      GestureDetector(
        onTap: () {
          if (item.quantity != 1) {
            context.read<CartBloc>().add(DecreaseQuantity(item));
          }
        },
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            color:
                item.quantity == 1 ? kSecondary1.withOpacity(0.4) : kSecondary2,
            alignment: Alignment.topCenter,
            child: const Icon(
              Icons.remove,
              color: kWhite,
            )),
      ),
      const SizedBox(width: 12),
      Text(item.quantity.toString()),
      const SizedBox(width: 12),
      GestureDetector(
        onTap: () => context.read<CartBloc>().add(IncreaseQuantity(item)),
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            color: kSecondary2,
            alignment: Alignment.topCenter,
            child: const Icon(
              Icons.add,
              color: kWhite,
            )),
      )
    ]);
  }
}
