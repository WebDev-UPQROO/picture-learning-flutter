import 'package:flutter/material.dart';
import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/routes.dart';

void main() => runApp(const MyApp());

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
