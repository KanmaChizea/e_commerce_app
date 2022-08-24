import 'package:e_commerce_app/core/widgets/page_handling_cubit.dart';
import 'package:e_commerce_app/home/presentation/bloc/product_bloc.dart';
import 'package:e_commerce_app/home/presentation/screens/home_screen.dart';
import 'package:e_commerce_app/saved_products/presentation/screens/saved_items_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageHandler extends StatelessWidget {
  const PageHandler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageHandlingCubit, int>(builder: (context, state) {
      switch (state) {
        case 0:
          return const HomeScreen();
        case 1:
          context.read<ProductBloc>().add(LoadAllProducts());
          return const SavedItemsScreen();
        case 2:
          return Container(child: Center(child: Text('Blehhh')));
      }
      return Container();
    });
  }
}
