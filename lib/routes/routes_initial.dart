import 'package:flutter/material.dart';
import 'package:picture_learning/screens/screens.dart';

class RoutesInitial {
  static const String welcomeApp = 'welcomeApp';
  static MaterialPageRoute welcomeAppScreen(settings) {
    return MaterialPageRoute(
      builder: (_) => WelcomeAppScreen(),
    );
  }
}
