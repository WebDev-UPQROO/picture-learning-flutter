import 'package:flutter/material.dart';
import 'package:picture_learning/models/services/auth_service.dart';
import 'package:picture_learning/models/services/local_service.dart';
import 'package:picture_learning/screens/screens.dart';
import 'package:provider/provider.dart';

class Routes {
  static const String initialRoute = home;

  // Auth
  static const loginOAuth = 'OAuth';
  static const loginEmail = 'email';

  static const registerEmail = 'registerEmail';
  static const registerPassword = 'registerPassword';

  // Home
  static const home = 'home';

  static Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      // Auth
      case loginOAuth:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => LoginOAuthProvider(
              context.read<LocalService>(),
            ),
            child: const LoginOAuthConsumer(LoginOAuthScreen()),
          ),
        );

      case loginEmail:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => LoginEmailProvider(
              context.read<AuthService>(),
              context.read<LocalService>(),
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
        final args = settings.arguments as RegisterPasswordScreenResponse;
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => RegisterPasswordProvider(
              context.read<AuthService>(),
            ),
            child: RegisterPasswordConsumer(RegisterPasswordScreen(
              username: args.username,
              email: args.email,
            )),
          ),
        );

      case home:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => HomeProvider(
              context.read<LocalService>(),
            ),
            child: HomeConsumer(HomeScreen()),
          ),
        );

      default:
        return MaterialPageRoute(builder: (_) => const LoginOAuthScreen());
    }
  }
}
