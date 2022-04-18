import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picture_learning/models/services/index.dart';
import 'package:picture_learning/screens/screens.dart';

class RoutesAuth {
  static const String loginOAuth = 'loginOAuth';
  static MaterialPageRoute loginOAuthScreen(settings) {
    return MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (context) => OAuthCubit(
          context.read<LocalService>(),
          context.read<AuthService>(),
        ),
        child: const LoginOAuthConsumer(LoginOAuthScreen()),
      ),
    );
  }

  static const String loginEmail = 'loginEmail';
  static MaterialPageRoute loginEmailScreen(settings) {
    return MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (context) => EmailCubit(
          context.read<AuthService>(),
          context.read<LocalService>(),
        ),
        child: const LoginEmailConsumer(LoginEmailScreen()),
      ),
    );
  }

  static const String registerEmail = 'registerEmail';
  static MaterialPageRoute registerEmailScreen(settings) {
    return MaterialPageRoute(
      builder: (_) => (const RegisterEmailScreen()),
    );
  }

  static const String registerPassword = 'registerPassword';
  static MaterialPageRoute registerPasswordScreen(settings) {
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
  }
}
