import 'package:e_commerce_app/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:e_commerce_app/checkout/presentation/bloc/checkout_progress_cubit.dart';

class CheckoutProgress extends StatelessWidget {
  const CheckoutProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              CheckoutTabItem(title: 'Delivery', index: 1),
              CheckoutTabItem(title: 'Payment', index: 2),
              CheckoutTabItem(title: 'Summary', index: 3),
            ]));
  }
}

class CheckoutTabItem extends StatelessWidget {
  final String title;
  final int index;
  const CheckoutTabItem({
    Key? key,
    required this.title,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutProgressCubit, int>(
      builder: (context, state) {
        return GestureDetector(
          onTap: context.read<CheckoutProgressCubit>().setIndex(index),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: index == state ? kPrimary : Colors.transparent,
                borderRadius: BorderRadius.circular(12)),
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(color: index == state ? kWhite : kGrey),
            ),
          ),
        );
      },
    );
  }
}
