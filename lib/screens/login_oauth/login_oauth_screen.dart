import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/routes.dart';
import 'package:picture_learning/screens/login_oauth/cubit/oauth_cubit.dart';
import 'package:picture_learning/widgets/buttons/elevated_button_icon_white.dart';
import 'package:picture_learning/widgets/gaps/gap_04.dart';
import 'package:picture_learning/widgets/scroll_keyboard.dart';

class LoginOAuthScreen extends StatelessWidget {
  const LoginOAuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: ScrollKeyboard(
        child: Stack(
          children: [
            // Background
            Container(
              color: Style.primary,
              width: size.width,
              height: size.height,
            ),

            // Buttons
            SafeArea(
              child: Gap04(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Header
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
                      height: size.height * 0.3,
                      fit: BoxFit.contain,
                    ),
                    const Spacer(),

                    // Google Login
                    ElevatedButtonIconWhite(
                      onPressed: () {
                        context.read<OAuthCubit>().postLogin();
                      },
                      icon: Image.asset('assets/icons/g_logo.png', height: 24),
                      label: const Text('Iniciar Sesión con Google'),
                    ),
                    SizedBox(height: size.height * 0.02),

                    // Email Login
                    ElevatedButtonIconWhite(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.loginEmail);
                      },
                      icon: const Icon(Icons.email),
                      label: const Text('Iniciar Sesión con tu email'),
                    ),

                    // Register with email
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.registerEmail);
                      },
                      style: TextButton.styleFrom(primary: Style.white),
                      child: RichText(
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
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
