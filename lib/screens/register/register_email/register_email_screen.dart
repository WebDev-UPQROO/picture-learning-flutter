import 'package:flutter/material.dart';
import 'package:picture_learning/routes.dart';
import 'package:picture_learning/screens/screens.dart';
import 'package:picture_learning/utils/validators.dart';
import 'package:picture_learning/widgets/form/form_auth.dart';

class RegisterEmailScreen extends StatelessWidget {
  const RegisterEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return FormAuth(
      imgHeader: Positioned(
        right: size.width * 0.1,
        top: size.height * 0.07,
        child: Image.asset(
          'assets/img/register_email.png',
          height: size.height * 0.4,
        ),
      ),

      // Username
      label1: 'Nombre de usuario',
      icon1: const Icon(Icons.person_outline),

      // Email
      label2: 'Correo Electrónico',
      icon2: const Icon(Icons.email_outlined),
      validator2: validateEmail,
      textInputType2: TextInputType.emailAddress,

      // Submit
      submitText: 'Continuar',
      submitFunction: (String username, String email) {
        final arg = RegisterPasswordScreenResponse(username, email);

        Navigator.pushNamed(
          context,
          Routes.registerPassword,
          arguments: arg,
        );
      },
    );
  }
}
