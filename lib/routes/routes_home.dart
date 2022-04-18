import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picture_learning/models/services/index.dart';
import 'package:picture_learning/screens/screens.dart';

class RoutesHome {
  static const String home = 'home';
  static MaterialPageRoute homeScreen(settings) {
    return MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (context) => HomeCubit(
          context.read<LocalService>(),
          context.read<GameService>(),
        ),
        child: const HomeConsumer(HomeScreen()),
      ),
    );
  }

  static const String appSettings = 'appSettings';
  static MaterialPageRoute appSettingsScreen(settings) {
    return MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (context) => SettingsCubit(
          context.read<LocalService>(),
          context.read<UserService>(),
        ),
        child: const SettingsConsumer(child: SettingsScreen()),
      ),
    );
  }

  static const String reviews = 'reviews';
  static MaterialPageRoute reviewsScreen(settings) {
    return MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (context) => CommentsCubit(
          context.read<UserService>(),
          context.read<LocalService>(),
        ),
        child: CommentsConsumer(child: CommentsScreen()),
      ),
    );
  }

  static const String credits = 'credits';
  static MaterialPageRoute creditsScreen(settings) {
    return MaterialPageRoute(
      builder: (_) => const CreditsScreen(),
    );
  }
}
