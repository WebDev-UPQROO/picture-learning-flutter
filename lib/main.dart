import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/models/services/auth_service.dart';
import 'package:picture_learning/models/services/game_service.dart';
import 'package:picture_learning/models/services/local_service.dart';
import 'package:picture_learning/models/services/user_service.dart';
import 'package:picture_learning/routes.dart';
import 'package:picture_learning/services/auth_serv.dart';
import 'package:picture_learning/services/game_serv.dart';
import 'package:picture_learning/services/local_serv.dart';
import 'package:picture_learning/services/user_serv.dart';

void main() => runApp(const AppRepository());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Style.appName,
      theme: Style.lightTheme,
      onGenerateRoute: Routes.routes,
      initialRoute: Routes.initialRoute,
    );
  }
}

class AppRepository extends StatelessWidget {
  const AppRepository({Key? key}) : super(key: key);

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
      child: const MyApp(),
    );
  }
}
