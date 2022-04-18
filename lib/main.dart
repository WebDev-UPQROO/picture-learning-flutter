import 'package:flutter/material.dart';
import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/provider_bloc.dart';
import 'package:picture_learning/provider_repository.dart';
import 'package:picture_learning/routes/routes.dart';

void main() => runApp(const AppGlobals());

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

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
      navigatorObservers: [routeObserver],
    );
  }
}

class AppGlobals extends StatelessWidget {
  const AppGlobals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ProviderRepository(
      child: ProviderBloc(
        child: MyApp(),
      ),
    );
  }
}
