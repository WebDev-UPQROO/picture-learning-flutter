import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picture_learning/models/services/index.dart';
import 'package:picture_learning/services/index.dart';

// Contains all the global repositories/services of the app
class ProviderRepository extends StatelessWidget {
  const ProviderRepository({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthService>(
          create: (context) => AuthServ(),
        ),
        RepositoryProvider<LocalService>(
          create: (context) => LocalServ(),
        ),
        RepositoryProvider<UserService>(
          create: (context) => UserServ(),
        ),
        RepositoryProvider<GameService>(
          create: (context) => GameServ(),
        ),
      ],
      child: child,
    );
  }
}
