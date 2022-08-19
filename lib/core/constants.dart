import 'package:flutter/material.dart';

inputField(String label) {
  return InputDecoration(
      labelText: label,
      hintText: label,
      //errorText
      focusedBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      //errorBorder
      enabledBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(20)));
}

const kPadding = EdgeInsets.fromLTRB(16, 24, 16, 0);
