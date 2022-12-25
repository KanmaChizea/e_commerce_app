import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/colors.dart';
import '../../domain/entity/cart_entity.dart';
import '../bloc/cart_bloc.dart';

class SubTotal extends StatelessWidget {
  const SubTotal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Subtotal',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: kBlack),
            ),
            Text(
              'Delivery fees not included yet',
              style:
                  Theme.of(context).textTheme.bodyText2?.copyWith(color: kGrey),
            )
          ],
        ),
        BlocBuilder<CartBloc, List<CartEntity>>(
          builder: (context, state) {
            var total = 0;
            for (var cart in state) {
              total = (total + cart.product.price * cart.quantity).toInt();
            }
            return Text(
              '\$$total',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: kBlack),
            );
          },
        )
      ],
    );
  }
}
