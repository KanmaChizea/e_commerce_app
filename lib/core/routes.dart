import 'widgets/bloc_providers.dart';
import '../presentation/auth/screens/login_screen.dart';
import 'package:flutter/material.dart';

import '../presentation/auth/screens/register_screen.dart';
import '../presentation/home/screens/home_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //final arguments = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (context) => const AppBlocProviders());
      case 'login':
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case 'register':
        return MaterialPageRoute(builder: (context) => const RegisterScreen());
      case 'home':
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      default:
        return _errorPage();
    }
  }

  static Route<dynamic> _errorPage() {
    return MaterialPageRoute(
        builder: (context) => Scaffold(
              body: Center(
                child: Column(
                  children: [
                    const Icon(Icons.error, size: 30, color: Colors.blueGrey),
                    Text('Error 404',
                        style: Theme.of(context).textTheme.headline1),
                    Text('Page not found',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            ?.copyWith(color: Colors.grey.shade700))
                  ],
                ),
              ),
            ));
  }
}
