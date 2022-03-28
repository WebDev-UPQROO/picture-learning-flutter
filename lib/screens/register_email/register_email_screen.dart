import 'package:flutter/material.dart';
import 'package:picture_learning/routes.dart';
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
      label1: 'Nombre de usuario',
      icon1: const Icon(Icons.person_outline),
      label2: 'Correo Electrónico',
      icon2: const Icon(Icons.email_outlined),
      submitText: 'Continuar',
      submitFunction: (String email, String password) {
        Navigator.pushNamed(context, Routes.registerPassword);
      },
    );
  }
}
