import 'package:flutter/material.dart';
import 'package:picture_learning/routes/index.dart';
import 'package:picture_learning/screens/screens.dart';

class Routes {
  static const String initialRoute = RoutesHome.home;

  static Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      // Auth
      case RoutesAuth.loginOAuth:
        return RoutesAuth.loginOAuthScreen(settings);
      case RoutesAuth.loginEmail:
        return RoutesAuth.loginEmailScreen(settings);
      case RoutesAuth.registerEmail:
        return RoutesAuth.registerEmailScreen(settings);
      case RoutesAuth.registerPassword:
        return RoutesAuth.registerPasswordScreen(settings);

      // Initial
      case RoutesInitial.welcomeApp:
        return RoutesInitial.welcomeAppScreen(settings);

      // Home
      case RoutesHome.appSettings:
        return RoutesHome.appSettingsScreen(settings);
      case RoutesHome.credits:
        return RoutesHome.creditsScreen(settings);
      case RoutesHome.home:
        return RoutesHome.homeScreen(settings);
      case RoutesHome.reviews:
        return RoutesHome.reviewsScreen(settings);

      // Game
      case RoutesGame.game:
        return RoutesGame.gameScreen(settings);

      default:
        return MaterialPageRoute(builder: (_) => const LoginOAuthScreen());
    }
  }
}
