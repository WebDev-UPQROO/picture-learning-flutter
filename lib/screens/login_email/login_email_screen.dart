import 'package:flutter/material.dart';
import 'package:picture_learning/screens/screens.dart';
import 'package:picture_learning/utils/validators.dart';
import 'package:picture_learning/widgets/form/form_auth.dart';
import 'package:provider/provider.dart';
import 'package:picture_learning/routes.dart';

class LoginEmailScreen extends StatelessWidget {
  const LoginEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return FormAuth(
      imgHeader: Positioned(
        right: size.width * 0.05,
        top: size.height * 0.07,
        child: Image.asset(
          'assets/img/login_help.png',
          height: size.height * 0.5,
        ),
      ),

      // Email
      label1: 'Correo electrónico',
      icon1: const Icon(Icons.person_outline),
      textInputType1: TextInputType.emailAddress,
      validator1: validateEmail,

      // Password
      label2: 'Contraseña',
      icon2: const Icon(Icons.lock_outline),
      obscureText2: true,
      submitText: 'Iniciar Sesión',
      submitFunction: (String email, String password) {
        context.read<LoginEmailProvider>().postLogin(email, password);
      },
    );
  }
}