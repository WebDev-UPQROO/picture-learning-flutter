import 'package:flutter/material.dart';
import 'package:picture_learning/routes.dart';
import 'package:picture_learning/screens/home/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final user = context.watch<HomeProvider>().user;

    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${user?.email}'),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.initialRoute);
                },
                child: Text('Salir'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
