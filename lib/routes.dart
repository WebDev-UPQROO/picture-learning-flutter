import 'package:flutter/material.dart';
import 'package:picture_learning/screens/screens.dart';
import 'package:provider/provider.dart';

class Routes {
  static const String initialRoute = loginOAuth;

  // Auth
  static const loginOAuth = 'OAuth';
  static const loginEmail = 'email';

  static Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      // Auth
      case loginOAuth:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (_) => LoginOAuthProvider(),
            child: const LoginOAuthConsumer(LoginOAuthScreen()),
          ),
        );

      default:
        return MaterialPageRoute(builder: (_) => const LoginOAuthScreen());
    }
  }
}
