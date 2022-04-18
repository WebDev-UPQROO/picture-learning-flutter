import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picture_learning/global/music/music_cubit.dart';
import 'package:picture_learning/models/game/game_ui.dart';
import 'package:picture_learning/models/services/auth_service.dart';
import 'package:picture_learning/models/services/game_service.dart';
import 'package:picture_learning/models/services/local_service.dart';
import 'package:picture_learning/models/services/user_service.dart';
import 'package:picture_learning/screens/comments_screen/comments_consumer.dart';
import 'package:picture_learning/screens/comments_screen/comments_screen.dart';
import 'package:picture_learning/screens/comments_screen/cubit/comments_cubit.dart';
import 'package:picture_learning/screens/credits/credits_screen.dart';
import 'package:picture_learning/screens/game/cubit/game_cubit.dart';
import 'package:picture_learning/screens/game/game_consumer.dart';
import 'package:picture_learning/screens/game/game_screen.dart';
import 'package:picture_learning/screens/screens.dart';
import 'package:picture_learning/screens/settings_screen/cubit/settings_cubit.dart';
import 'package:picture_learning/screens/settings_screen/settings_consumer.dart';
import 'package:picture_learning/screens/settings_screen/settings_screen.dart';

class Routes {
  static const String initialRoute = home;

  // Auth
  static const loginOAuth = 'OAuth';
  static const loginEmail = 'email';
  static const welcomeApp = 'welcome';

  static const registerEmail = 'registerEmail';
  static const registerPassword = 'registerPassword';

  // Home
  static const home = 'home';
  static const credits = 'credits';
  static const appSettings = 'appSettings';
  static const reviews = 'reviews';

  // Game
  static const game = 'game';

  static Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      // Auth
      case loginOAuth:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => OAuthCubit(
              context.read<LocalService>(),
              context.read<AuthService>(),
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
          builder: (_) => (const RegisterEmailScreen()),
        );

      case registerPassword:
        final args = settings.arguments as RegisterPasswordScreenResponse;

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => PasswordCubit(
              context.read<UserService>(),
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
              context.read<GameService>(),
            ),
            child: const HomeConsumer(HomeScreen()),
          ),
        );

      case appSettings:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SettingsCubit(
              context.read<LocalService>(),
              context.read<UserService>(),
            ),
            child: const SettingsConsumer(child: SettingsScreen()),
          ),
        );

      case reviews:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => CommentsCubit(
              context.read<UserService>(),
              context.read<LocalService>(),
            ),
            child: CommentsConsumer(child: CommentsScreen()),
          ),
        );

      case game:
        GameUI game = settings.arguments as GameUI;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => GameCubit(
              context.read<GameService>(),
              context.read<LocalService>(),
              context.read<MusicCubit>(),
            ),
            child: GameConsumer(
              uid: game.uid,
              child: GameScreen(game: game),
            ),
          ),
        );

      case credits:
        return MaterialPageRoute(
          builder: (_) => const CreditsScreen(),
        );

      default:
        return MaterialPageRoute(builder: (_) => const LoginOAuthScreen());
    }
  }
}
