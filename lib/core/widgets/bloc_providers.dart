import '../../data/auth/repository/auth_repository.dart';
import '../../data/auth/source/auth_service.dart';
import '../../presentation/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/auth/widgets/auth_controller.dart';

class AppBlocProviders extends StatelessWidget {
  const AppBlocProviders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authRepository = AuthRepository(AuthService());
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
            create: (_) => AuthBloc(authRepository)..add(CheckLoginStatus()))
      ],
      child: const AuthScreenController(),
    );
  }
}
