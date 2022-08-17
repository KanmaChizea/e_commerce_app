import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'injection_container.dart' as di;
import 'core/routes.dart';
import 'core/theme/theme.dart';
import 'firebase_options.dart';

void main() async {
  di.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'E-commerce app',
    onGenerateRoute: Routes.generateRoute,
    theme: lightTheme,
  ));
}
