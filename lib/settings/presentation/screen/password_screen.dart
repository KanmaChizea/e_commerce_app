import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/theme/buttons.dart';
import '../../../core/theme/colors.dart';
import '../../../core/widgets/text_field.dart';
import '../widgets/settings_appbar.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  late TextEditingController emailController;
  late TextEditingController currentPasswordController;
  late TextEditingController newPasswordController;

  @override
  void initState() {
    emailController = TextEditingController();
    currentPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kPadding,
          child: Column(
            children: [
              const SettingsAppBar(title: 'Change password'),
              const SizedBox(height: 32),
              Form(
                  child: Column(
                children: [
                  InputField(controller: emailController, label: 'Email'),
                  const SizedBox(height: 24),
                  InputField(
                      controller: currentPasswordController,
                      label: 'Current password'),
                  const SizedBox(height: 32),
                  InputField(
                      controller: newPasswordController, label: 'New password'),
                  const SizedBox(height: 32),
                  ElevatedButton(
                      onPressed: () {},
                      style: fullButton.copyWith(
                        minimumSize:
                            MaterialStateProperty.all(Size(size.width, 48)),
                      ),
                      child: Text(
                        'Change password',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            ?.copyWith(color: kWhite),
                      ))
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    newPasswordController.dispose();
    currentPasswordController.dispose();
    super.dispose();
  }
}
