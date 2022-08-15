import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/routes.dart';
import 'core/theme/theme.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce app',
      initialRoute: '/',
      onGenerateRoute: Routes.generateRoute,
      theme: lightTheme,
    );
  }
}
