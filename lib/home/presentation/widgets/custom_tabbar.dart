import 'package:e_commerce_app/core/theme/colors.dart';
import 'package:e_commerce_app/home/presentation/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({Key? key}) : super(key: key);

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  late int selectedIndex;
  final categoriesList = [
    "All",
    "Electronics",
    "Jewelery",
    "Men's clothing",
    "Women's clothing"
  ];

  @override
  void initState() {
    selectedIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: ((context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
            if (index == 0) {
              context.read<ProductBloc>().add(LoadAllProducts());
            } else {
              context.read<ProductBloc>().add(LoadProductCategory(
                  category: categoriesList[index].toLowerCase()));
            }
          },
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 12),
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 24),
            decoration: BoxDecoration(
                color: index == selectedIndex ? kPrimary : Colors.transparent,
                borderRadius: BorderRadius.circular(24)),
            child: Text(
              categoriesList[index],
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(color: index == selectedIndex ? kWhite : kGrey),
            ),
          ),
        );
      }),
    );
  }
}
