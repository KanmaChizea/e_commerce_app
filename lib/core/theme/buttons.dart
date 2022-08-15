import 'colors.dart';
import 'package:flutter/material.dart';

ButtonStyle fullButton = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(kPrimary),
  foregroundColor: MaterialStateProperty.all(kWhite),
  overlayColor: MaterialStateProperty.all(kSecondary2),
  shape: MaterialStateProperty.all(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
);
