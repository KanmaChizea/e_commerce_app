import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/buttons.dart';
import '../../../core/theme/colors.dart';
import '../bloc/auth_bloc.dart';
import '../screens/login_screen.dart';
import '../screens/register_screen.dart';

class AuthScreenController extends StatelessWidget {
  const AuthScreenController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoggedIn) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('home', (route) => false);
          }
          if (state is AuthInitial && state.isError) {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => AlertDialog(
                      content: Container(
                        width: size.width - 400,
                        height: size.height / 3,
                        padding: const EdgeInsets.all(8),
                        child: Column(children: [
                          const Icon(Icons.error, size: 70, color: kRed),
                          const SizedBox(height: 16),
                          Text('Error!',
                              style: Theme.of(context).textTheme.bodyText1),
                          const SizedBox(height: 16),
                          Text(state.failure!.message,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(color: kGrey)),
                          const SizedBox(height: 16),
                          ElevatedButton(
                              onPressed: () => Navigator.of(context).pop(),
                              style: fullButton,
                              child: const Text('Try again'))
                        ]),
                      ),
                    ));
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(builder: ((context, state) {
          if (state is AuthInitial) {
            if (state.isLogin) return const LoginScreen();
            if (!state.isLogin) return const RegisterScreen();
          }
          return Container();
        })),
      ),
    );
  }
}
