import 'package:e_commerce_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class Toast extends SnackBar {
  Toast({
    Key? key,
    required this.label,
    required this.context,
  }) : super(
          key: key,
          content: Text(label),
          elevation: 0,
          backgroundColor: kGrey,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          behavior: SnackBarBehavior.floating,
        );

  final String label;
  final BuildContext context;
}
