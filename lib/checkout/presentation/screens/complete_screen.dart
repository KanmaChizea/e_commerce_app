import 'package:e_commerce_app/checkout/presentation/bloc/checkout_progress_cubit.dart';
import 'package:e_commerce_app/checkout/presentation/widgets/delivery_screen.dart';
import 'package:e_commerce_app/checkout/presentation/widgets/payment_screen.dart';
import 'package:e_commerce_app/checkout/presentation/widgets/summary_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/colors.dart';
import '../widgets/checkout_progress.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckoutProgressCubit(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: kBlack,
          title: Text('Checkout',
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  ?.copyWith(color: kBlack)),
          bottom: const PreferredSize(
              preferredSize: Size.fromHeight(100), child: CheckoutProgress()),
        ),
        body: BlocBuilder<CheckoutProgressCubit, int>(
          builder: (context, state) {
            switch (state) {
              case 1:
                return const DeliveryScreen();
              case 2:
                return const PaymentScreen();
              case 3:
                return const SummaryScreen();
              default:
                return Container();
            }
          },
        ),
      ),
    );
  }
}
