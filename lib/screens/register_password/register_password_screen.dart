import 'package:flutter/material.dart';
import 'package:picture_learning/widgets/form/form_auth.dart';

class RegisterPasswordScreen extends StatelessWidget {
  const RegisterPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return FormAuth(
      imgHeader: Positioned(
        left: 0,
        top: size.height * 0.07,
        child: Image.asset(
          'assets/img/register_password.png',
          height: size.height * 0.5,
        ),
      ),
      label1: 'Contraseña',
      icon1: const Icon(Icons.person_outline),
      label2: 'Verificar contraseña',
      icon2: const Icon(Icons.email_outlined),
      submitText: 'Continuar',
      submitFunction: (String email, String password) {
        // Navigator.pushNamed(context, Routes.registerPassword);
      },
    );
  }
}
