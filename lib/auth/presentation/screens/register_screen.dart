import '../../data/model/register_info.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/auth_screen_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/validations.dart';
import '../../../core/widgets/text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  late GlobalKey<FormState> _key;

  @override
  void initState() {
    firstName = TextEditingController();
    lastName = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
    _key = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthScreenLayout(
          title: 'Sign up',
          header: 'Welcome to', //TODO: insert app name
          subheader: 'Hello there! Sign up to start shopping with us',
          formKey: _key,
          elevatedButtonText: 'Sign up',
          textButtonText: 'Sign in',
          labelText: 'Already have an account',
          textButtonFunction: () =>
              context.read<AuthBloc>().add(ToggleToLogin()),
          elevatedButtonFunction: () {
            if (_key.currentState!.validate()) {
              final regInfo = RegisterInfo(
                  email: email.text,
                  password: password.text,
                  firstName: firstName.text,
                  lastName: lastName.text);

              context.read<AuthBloc>().add(AuthRegister(regInfo));
            }
          },
          child: Column(children: [
            InputField(
                controller: firstName,
                label: 'First name',
                validator: (_) => compulsoryFieldValidation(email.text)),
            const SizedBox(height: 24),
            InputField(
                controller: lastName,
                label: 'Last name',
                validator: (_) => compulsoryFieldValidation(email.text)),
            const SizedBox(height: 24),
            InputField(
                controller: email,
                label: 'Email',
                validator: (_) => compulsoryFieldValidation(email.text)),
            const SizedBox(height: 24),
            InputField(
                controller: password,
                isPassword: true,
                label: 'Password',
                validator: (_) => compulsoryFieldValidation(password.text)),
            const SizedBox(height: 24),
            InputField(
                controller: password,
                label: 'Confirm Password',
                isPassword: true,
                validator: (_) => compulsoryFieldValidation(password.text)),
          ])),
    );
  }

  @override
  void dispose() {
    email.dispose();
    firstName.dispose();
    lastName.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }
}
