import 'package:e_commerce_app/cart/presentation/bloc/cart_bloc.dart';
import 'package:e_commerce_app/settings/presentation/bloc/settings_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'auth/presentation/bloc/auth_bloc.dart';
import 'core/widgets/page_handling_cubit.dart';
import 'home/presentation/bloc/product_bloc.dart';
import 'core/dependency_injection/injection_container.dart' as di;
import 'core/routes.dart';
import 'core/theme/theme.dart';
import 'firebase_options.dart';
import 'core/dependency_injection/injection_container.dart';
import 'saved_products/presentation/cubit/saved_product_cubit.dart';
import 'settings/presentation/bloc/address_bloc.dart';

void main() async {
  di.init();
  await Hive.initFlutter();
  await Hive.openBox('data');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
              create: (_) => sl<AuthBloc>()..add(CheckLoginStatus())),
          BlocProvider<ProductBloc>(
              create: (_) => sl<ProductBloc>()..add(LoadAllProducts())),
          BlocProvider<SavedProductCubit>(
              create: (_) => sl<SavedProductCubit>()..fetchSavedProducts()),
          BlocProvider(create: (_) => PageHandlingCubit()),
          BlocProvider(create: (_) => sl<SettingsBloc>()..add(LoadSettings())),
          BlocProvider(create: (_) => sl<AddressBloc>()),
          BlocProvider(create: (_) => sl<CartBloc>())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'E-commerce app',
          onGenerateRoute: Routes.generateRoute,
          theme: lightTheme,
        ));
  }
}
