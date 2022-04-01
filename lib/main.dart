import 'package:flutter/material.dart';
import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/models/services/auth_service.dart';
import 'package:picture_learning/models/services/local_service.dart';
import 'package:picture_learning/routes.dart';
import 'package:picture_learning/services/auth_serv.dart';
import 'package:picture_learning/services/local_serv.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppRepository());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (context) => AuthServ(),
        ),
        Provider<LocalService>(
          create: (context) => LocalServ(),
        )
      ],
      child: const MyApp(),
    );
  }
}