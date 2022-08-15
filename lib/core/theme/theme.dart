import 'package:flutter/material.dart';

import 'buttons.dart';
import 'colors.dart';
import 'text_theme.dart';

ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: kWhite,
    primarySwatch: Colors.red,
    primaryColor: kPrimary,
    elevatedButtonTheme: ElevatedButtonThemeData(style: fullButton),
    textTheme: const TextTheme(
        headline1: h1,
        headline2: h2,
        headline3: h3,
        subtitle1: h4,
        subtitle2: h5,
        bodyText1: body1,
        bodyText2: body2,
        caption: caption));
