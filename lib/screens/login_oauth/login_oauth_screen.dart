import 'package:flutter/material.dart';
import 'package:picture_learning/constants/style.dart';
import 'package:provider/provider.dart';
import '../screens.dart';

class LoginOAuthScreen extends StatelessWidget {
  const LoginOAuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final read = context.read<LoginOAuthProvider>();
    final watch = context.watch<LoginOAuthProvider>();

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/img/bg.jpg',
            fit: BoxFit.cover,
            width: size.width,
            height: size.height,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: double.infinity, height: 30),
              Text(
                'Picture Learning ${watch.count}',
                style: TextStyle(
                  fontSize: Style.h1,
                  color: Style.white,
                ),
              ),
              ElevatedButton(
                onPressed: () => read.increment(),
                child: Text('hola'),
              )
            ],
          )
        ],
      ),
    );
  }
}
