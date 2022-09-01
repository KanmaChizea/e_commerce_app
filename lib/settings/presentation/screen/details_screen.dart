import 'package:e_commerce_app/settings/presentation/bloc/settings_bloc.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/theme/buttons.dart';
import 'package:e_commerce_app/core/widgets/text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/colors.dart';
import '../widgets/settings_appbar.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  @override
  void initState() {
    firstNameController = TextEditingController.fromValue(
        TextEditingValue(text: context.read<SettingsBloc>().state.firstName));
    lastNameController = TextEditingController.fromValue(
        TextEditingValue(text: context.read<SettingsBloc>().state.lastName));
    emailController = TextEditingController.fromValue(
        TextEditingValue(text: context.read<SettingsBloc>().state.email));
    phoneController = TextEditingController.fromValue(
        TextEditingValue(text: context.read<SettingsBloc>().state.phoneNo));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: kPadding.copyWith(bottom: 20),
          child: Column(
            children: [
              const SettingsAppBar(title: 'Your personal data'),
              const SizedBox(height: 32),
              InputField(controller: firstNameController, label: 'First name'),
              const SizedBox(height: 24),
              InputField(controller: lastNameController, label: 'Last name'),
              const SizedBox(height: 24),
              InputField(controller: emailController, label: 'Email'),
              const SizedBox(height: 8),
              Row(
                children: const [
                  SizedBox(
                    width: 120,
                    child: RadioButton(
                      value: false,
                      title: 'Male',
                    ),
                  ),
                  Expanded(
                    child: RadioButton(value: true, title: 'Female'),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              InputField(controller: phoneController, label: 'Phone'),
              const SizedBox(height: 56),
              ElevatedButton(
                  onPressed: () async {
                    context.read<SettingsBloc>().add(SetName(
                        firstName: firstNameController.text,
                        lastName: lastNameController.text));
                    context
                        .read<SettingsBloc>()
                        .add(SetEmail(emailController.text));
                    context
                        .read<SettingsBloc>()
                        .add(SetPhone(phoneController.text));
                  },
                  style: fullButton.copyWith(
                    minimumSize:
                        MaterialStateProperty.all(Size(size.width, 48)),
                  ),
                  child: Text(
                    'Save',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        ?.copyWith(color: kWhite),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}

class RadioButton extends StatefulWidget {
  const RadioButton({
    Key? key,
    required this.value,
    required this.title,
  }) : super(key: key);

  final bool value;
  final String title;

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      activeColor: kPrimary,
      value: widget.value,
      groupValue: context.read<SettingsBloc>().state.gender,
      onChanged: (_) {},
      title: Text(widget.title),
      contentPadding: EdgeInsets.zero,
    );
  }
}
