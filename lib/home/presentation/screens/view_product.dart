import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/theme/colors.dart';
import 'package:e_commerce_app/home/presentation/widgets/appbar_container.dart';
import 'package:e_commerce_app/home/presentation/widgets/favourite_icon.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/home/domain/entities/product_entity.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../core/theme/buttons.dart';

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
                    child: Image.network(product.image, fit: BoxFit.contain),
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
                      const FavouriteIcon()
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
                onPressed: () {},
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
