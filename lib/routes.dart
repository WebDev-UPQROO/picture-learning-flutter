import 'package:flutter/material.dart';
import 'package:picture_learning/models/services/auth_service.dart';
import 'package:picture_learning/screens/screens.dart';
import 'package:provider/provider.dart';

class Routes {
  static const String initialRoute = loginOAuth;

  // Auth
  static const loginOAuth = 'OAuth';
  static const loginEmail = 'email';

  static const registerEmail = 'registerEmail';
  static const registerPassword = 'registerPassword';

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

      case loginEmail:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => LoginEmailProvider(
              context.read<AuthService>(),
            ),
            child: const LoginEmailConsumer(LoginEmailScreen()),
          ),
        );

      case registerEmail:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (_) => RegisterEmailProvider(),
            child: const RegisterEmailConsumer(RegisterEmailScreen()),
          ),
        );

      case registerPassword:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (_) => RegisterPasswordProvider(),
            child: const RegisterPasswordConsumer(RegisterPasswordScreen()),
          ),
        );

      default:
        return MaterialPageRoute(builder: (_) => const LoginOAuthScreen());
    }
  }
}
