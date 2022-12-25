import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/colors.dart';
import '../cubit/saved_product_cubit.dart';

class FavouriteIcon extends StatelessWidget {
  final int id;
  const FavouriteIcon({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedProductCubit, List>(builder: (context, state) {
      final isSaved = state.contains(id);
      return GestureDetector(
        onTap: () {
          log("t");
          isSaved
              ? context.read<SavedProductCubit>().deleteSavedProduct(id)
              : context.read<SavedProductCubit>().addSavedProduct(id);
        },
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration:
              const BoxDecoration(color: kSecondary3, shape: BoxShape.circle),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (child, animation) => ScaleTransition(
              scale: animation,
              child: child,
            ),
            child: Icon(
              key: ValueKey<bool>(isSaved),
              isSaved ? Icons.favorite : Icons.favorite_border,
              color: kRed,
              size: 20,
            ),
          ),
        ),
      );
    });
  }
}
