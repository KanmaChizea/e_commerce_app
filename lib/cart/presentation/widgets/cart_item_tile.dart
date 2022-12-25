import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/colors.dart';
import '../../domain/entity/cart_entity.dart';
import '../bloc/cart_bloc.dart';
import 'quantity_widget.dart';

class CartItemTile extends StatelessWidget {
  const CartItemTile({
    Key? key,
    required this.item,
  }) : super(key: key);

  final CartEntity item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 50,
                child: CachedNetworkImage(
                  imageUrl: item.product.image,
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.image_outlined),
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.product.title,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.copyWith(color: kBlack)),
                    const SizedBox(height: 8),
                    Text('\$${item.product.price.toString()}',
                        overflow: TextOverflow.fade,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: kBlack)),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => context.read<CartBloc>().add(RemoveFromCart(item)),
                child: const Icon(
                  Icons.delete,
                  color: kPrimary,
                  size: 30,
                ),
              ),
              QuantityWidget(item: item)
            ],
          )
        ],
      ),
    );
  }
}
