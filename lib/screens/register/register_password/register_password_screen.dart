import 'package:flutter/material.dart';
import 'package:picture_learning/screens/screens.dart';
import 'package:picture_learning/utils/validator.dart';
import 'package:picture_learning/widgets/form/form_auth.dart';
import 'package:provider/provider.dart';

class RegisterPasswordScreenResponse {
  late String username;
  late String email;

  RegisterPasswordScreenResponse(this.username, this.email);
}

class RegisterPasswordScreen extends StatelessWidget {
  const RegisterPasswordScreen({
    Key? key,
    required this.username,
    required this.email,
  }) : super(key: key);

  final String username;
  final String email;

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

      // Password
      label1: 'Contraseña',
      icon1: const Icon(Icons.lock_outline),
      obscureText1: true,
      validator1: validatePassword,

      // Confirm password
      label2: 'Verificar contraseña',
      icon2: const Icon(Icons.lock_outline),
      obscureText2: true,
      validator2: validatePassword,

      // Submit
      compareFields: true,
      submitText: 'Continuar',
      submitFunction: (String password, _) {
        context.read<PasswordCubit>().postUser(
              username,
              email,
              password,
            );
      },
    );
  }
}
