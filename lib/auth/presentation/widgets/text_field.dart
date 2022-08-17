import 'package:flutter/material.dart';

import '../../../core/theme/colors.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.controller,
    this.validator,
    this.isPassword,
    required this.label,
  }) : super(key: key);

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool? isPassword;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: isPassword ?? false,
      style: Theme.of(context).textTheme.bodyText2,
      decoration: InputDecoration(
          labelText: label,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                  color: Theme.of(context).primaryColor, width: 1.5)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: kRed)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          hintStyle: Theme.of(context)
              .inputDecorationTheme
              .labelStyle
              ?.copyWith(fontSize: 14),
          floatingLabelStyle: Theme.of(context)
              .inputDecorationTheme
              .floatingLabelStyle
              ?.copyWith(fontSize: 12),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          errorStyle:
              Theme.of(context).textTheme.caption?.copyWith(color: kRed)),
    );
  }
}
