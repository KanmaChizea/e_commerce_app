import 'package:e_commerce_app/core/widgets/page_handler.dart';

import '../auth/presentation/widgets/auth_controller.dart';
import '../home/domain/entities/product_entity.dart';
import '../home/presentation/screens/view_product.dart';

import '../auth/presentation/screens/login_screen.dart';
import '../auth/presentation/screens/register_screen.dart';

import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (context) => const AuthScreenController());
      case 'login':
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case 'register':
        return MaterialPageRoute(builder: (context) => const RegisterScreen());
      case 'view product':
        return MaterialPageRoute(
            builder: (context) =>
                ViewProductScreen(product: arguments as Product));
      case 'page handler':
        return MaterialPageRoute(builder: (context) => const PageHandler());
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
