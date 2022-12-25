import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/cart/data/model/cart_model.dart';
import 'package:e_commerce_app/cart/presentation/bloc/cart_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants.dart';
import '../../../core/theme/colors.dart';
import 'package:flutter/material.dart';
import '../../../core/widgets/toast.dart';
import '../../domain/entities/product_entity.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../core/theme/buttons.dart';
import '../../../saved_products/presentation/widgets/favourite_icon.dart';

class ViewProductScreen extends StatelessWidget {
  const ViewProductScreen({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: kPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: size.width,
                    height: size.height * 0.4,
                    child: Hero(
                        tag: product.image,
                        child: CachedNetworkImage(
                            imageUrl: product.image,
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.image_outlined),
                            fit: BoxFit.contain)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.only(
                                left: 8, top: 6, bottom: 6),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: kSecondary3),
                            child: const Icon(
                              Icons.arrow_back_ios,
                              size: 20,
                              color: kBlack,
                            )),
                      ),
                      FavouriteIcon(id: product.id),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 36),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: size.width * 0.65,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  ?.copyWith(color: kBlack),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              product.category.replaceRange(
                                  0, 1, product.category[0].toUpperCase()),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(color: kGrey),
                            ),
                          ]),
                    ),
                    Text(
                      '\$${product.price.toString()}',
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          ?.copyWith(color: kPrimary),
                    )
                  ]),
              const SizedBox(height: 8),
              RatingBar.builder(
                initialRating: product.rating.toDouble(),
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemSize: 24,
                itemCount: 5,
                itemBuilder: (context, _) => const Icon(
                  Icons.star_rate_rounded,
                  color: Colors.amber,
                ),
                onRatingUpdate: (_) {},
              ),
              const SizedBox(height: 8),
              Text(product.description,
                  style: Theme.of(context).textTheme.bodyText2),
              const SizedBox(height: 36),
              ElevatedButton(
                onPressed: () {
                  Cart cart = Cart(product: product, quantity: 1);
                  context.read<CartBloc>().add(AddToCart(cart.toEntity()));
                  ScaffoldMessenger.of(context).showSnackBar(Toast(
                      label: 'Successfully added to cart', context: context));
                },
                style: fullButton.copyWith(
                  minimumSize: MaterialStateProperty.all(Size(size.width, 48)),
                ),
                child: Text('Add to cart',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        ?.copyWith(color: kWhite)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
