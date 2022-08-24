import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/colors.dart';
import '../bloc/product_bloc.dart';
import '../../../saved_products/presentation/widgets/favourite_icon.dart';

class ProductsBody extends StatelessWidget {
  const ProductsBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoaded) {
          return Expanded(
            child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 32,
                    mainAxisExtent: 192),
                itemCount: state.productList.length,
                itemBuilder: (context, index) {
                  final product = state.productList[index];
                  return GestureDetector(
                    onTap: () => Navigator.of(context)
                        .pushNamed('view product', arguments: product),
                    child: SizedBox(
                      height: 500,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 150,
                                width:
                                    (MediaQuery.of(context).size.width - 64) /
                                        2,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 24),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: kGrey, width: 1.5),
                                    borderRadius: BorderRadius.circular(16)),
                                child: Hero(
                                  tag: product.image,
                                  child: Image.network(
                                    product.image,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                              Positioned(
                                  right: 12,
                                  top: 8,
                                  child: FavouriteIcon(id: product.id))
                            ],
                          ),
                          Text(
                            product.title,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .headline3
                                ?.copyWith(
                                    fontWeight: FontWeight.normal,
                                    color: kBlack),
                          ),
                          Text(
                            '\$${product.price.toString()}',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                ?.copyWith(color: kPrimary),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          );
        } else if (state is ProductFailed) {
          return Expanded(child: Center(child: Text(state.failure.message)));
        }
        return const Expanded(
            child: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
