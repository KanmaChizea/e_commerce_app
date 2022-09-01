import 'package:flutter/material.dart';

import '../theme/colors.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    this.controller,
    this.validator,
    this.isPassword,
    this.initialValue,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    required this.label,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool? isPassword;
  final String label;
  final String? initialValue;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final Function(String?)? onFieldSubmitted;
  final Function()? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      initialValue: initialValue,
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
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      onEditingComplete: onEditingComplete,
    );
  }
}
