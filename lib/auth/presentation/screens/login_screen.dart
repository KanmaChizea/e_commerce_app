import '../../../core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/validations.dart';
import '../../data/model/login_info.dart';
import '../bloc/auth_bloc.dart';

import '../widgets/auth_screen_layout.dart';
import '../widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> _key;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    _key = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthScreenLayout(
            title: 'Sign in',
            header: 'Welcome Back',
            subheader: 'Hello there! Sign in to continue',
            formKey: _key,
            elevatedButtonText: 'Sign in',
            textButtonText: 'Sign up',
            labelText: 'Don\'t have an account?',
            elevatedButtonFunction: () {
              if (_key.currentState!.validate()) {
                final loginInfo = LoginInfo(
                    email: emailController.text,
                    password: passwordController.text);

                context.read<AuthBloc>().add(AuthLogin(loginInfo));
              }
            },
            textButtonFunction: () =>
                context.read<AuthBloc>().add(ToggleToRegister()),
            child: Column(children: [
              InputField(
                  controller: emailController,
                  label: 'Email',
                  validator: (_) =>
                      compulsoryFieldValidation(emailController.text)),
              const SizedBox(height: 24),
              InputField(
                  controller: passwordController,
                  label: 'Password',
                  validator: (_) =>
                      compulsoryFieldValidation(passwordController.text)),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                    onPressed: () {},
                    style: Theme.of(context).textButtonTheme.style?.copyWith(
                        backgroundColor: MaterialStateProperty.all(kPrimary)),
                    child: const Text('Forgot Password?')),
              ),
            ])));
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
