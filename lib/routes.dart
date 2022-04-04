import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picture_learning/models/services/auth_service.dart';
import 'package:picture_learning/models/services/local_service.dart';
import 'package:picture_learning/screens/credits/credits_screen.dart';
import 'package:picture_learning/screens/screens.dart';
import 'package:provider/provider.dart';

class Routes {
  static const String initialRoute = loginOAuth;

  // Auth
  static const loginOAuth = 'OAuth';
  static const loginEmail = 'email';
  static const welcomeApp = 'welcome';

  static const registerEmail = 'registerEmail';
  static const registerPassword = 'registerPassword';

  // Home
  static const home = 'home';
  static const credits = 'credits';

  static Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      // Auth
      case loginOAuth:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => OAuthCubit(
              context.read<LocalService>(),
            ),
            child: const LoginOAuthConsumer(LoginOAuthScreen()),
          ),
        );

      case loginEmail:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => EmailCubit(
              context.read<AuthService>(),
              context.read<LocalService>(),
            ),
            child: const LoginEmailConsumer(LoginEmailScreen()),
          ),
        );

      case welcomeApp:
        return MaterialPageRoute(
          builder: (_) => WelcomeAppScreen(),
        );

      case registerEmail:
        return MaterialPageRoute(
          builder: (_) => (RegisterEmailScreen()),
        );

      case registerPassword:
        final args = settings.arguments as RegisterPasswordScreenResponse;

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => PasswordCubit(
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
          builder: (_) => BlocProvider(
            create: (context) => HomeCubit(
              context.read<LocalService>(),
            ),
            child: HomeConsumer(HomeScreen()),
          ),
        );

      case credits:
        return MaterialPageRoute(
          builder: (_) => CreditsScreen(),
        );

      default:
        return MaterialPageRoute(builder: (_) => const LoginOAuthScreen());
    }
  }
}
