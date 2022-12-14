import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cart/data/model/cart_model.dart';
import '../../../cart/presentation/bloc/cart_bloc.dart';
import '../../../core/theme/colors.dart';
import '../../../home/domain/entities/product_entity.dart';
import '../cubit/saved_product_cubit.dart';

class SavedItemCard extends StatelessWidget {
  const SavedItemCard({
    Key? key,
    required this.savedProducts,
  }) : super(key: key);

  final Product savedProducts;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            onTap: () => Navigator.of(context)
                .pushNamed('view product', arguments: savedProducts),
            contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            leading: SizedBox(
              width: 50,
              child: CachedNetworkImage(
                imageUrl: savedProducts.image,
                errorWidget: (context, url, error) =>
                    const Icon(Icons.image_outlined),
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    savedProducts.title,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                GestureDetector(
                    onTap: () async {
                      context
                          .read<SavedProductCubit>()
                          .deleteSavedProduct(savedProducts.id);
                      ScaffoldMessenger.of(context).showSnackBar(Toast(
                        label: 'Successfully removed from saved items',
                        context: context,
                      ));
                    },
                    child: const Icon(Icons.close))
              ],
            ),
            subtitle: Text(
              '\$${savedProducts.price}',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: ElevatedButton(
                onPressed: () {
                  Cart cart = Cart(product: savedProducts, quantity: 1);
                  context.read<CartBloc>().add(AddToCart(cart.toEntity()));
                  ScaffoldMessenger.of(context).showSnackBar(Toast(
                      label: 'Successfully added to cart', context: context));
                },
                child: Text(
                  'Buy now',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      ?.copyWith(color: kWhite),
                )),
          ),
          const SizedBox(height: 8)
        ],
      ),
    );
  }
}
