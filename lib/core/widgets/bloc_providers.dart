import 'package:e_commerce_app/home/presentation/bloc/product_bloc.dart';
import 'package:e_commerce_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth/presentation/bloc/auth_bloc.dart';
import '../../auth/presentation/widgets/auth_controller.dart';

class AppBlocProviders extends StatelessWidget {
  const AppBlocProviders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
            create: (_) => sl<AuthBloc>()..add(CheckLoginStatus())),
      ],
      child: const AuthScreenController(),
    );
  }
}
