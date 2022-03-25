import 'package:flutter/material.dart';
import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/routes.dart';
import 'package:picture_learning/widgets/buttons/elevated_button_icon_white.dart';
import 'package:picture_learning/widgets/gaps/gap_04.dart';

class LoginOAuthScreen extends StatelessWidget {
  const LoginOAuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Style.primary,
            width: size.width,
            height: size.height,
          ),
          // Image.asset(
          //   'assets/img/bg.jpg',
          //   fit: BoxFit.cover,
          //   width: size.width,
          //   height: size.height,
          // ),
          SafeArea(
            child: Gap04(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Picture \nLearning',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Style.h1,
                      color: Style.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Image.asset(
                    'assets/img/logo.png',
                  ),
                  const Spacer(),
                  ElevatedButtonIconWhite(
                    onPressed: () {},
                    icon: Image.asset('assets/icons/g_logo.png', height: 24),
                    label: const Text('Iniciar Sesión con Google'),
                  ),
                  SizedBox(height: size.height * 0.02),
                  ElevatedButtonIconWhite(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.loginEmail);
                    },
                    icon: const Icon(Icons.email),
                    label: const Text('Iniciar Sesión con tu email'),
                  ),
                  SizedBox(height: size.height * 0.05),
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: '¿No tienes una cuenta? ',
                        ),
                        TextSpan(
                          text: 'Registrate',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
