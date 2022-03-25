import 'package:flutter/material.dart';
import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/utils/validators.dart';
import 'package:picture_learning/widgets/gaps/gap_04.dart';
import 'package:picture_learning/widgets/painters/painer_curve.dart';
import 'package:picture_learning/widgets/text/text_md_bold_grey800.dart';

final _form = GlobalKey<FormState>();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

//for storing form state.
class LoginEmailScreen extends StatelessWidget {
  const LoginEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Style.primary,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            right: size.width * 0.05,
            top: size.height * 0.07,
            child: Image.asset(
              'assets/img/login_help.png',
              height: size.height * 0.5,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: size.height * 0.61,
              width: size.width,
              child: CustomPaint(
                painter: PainterCurve(color: Style.white),
              ),
            ),
          ),
          Form(
            key: _form,
            child: SafeArea(
              child: Gap04(
                child: SizedBox(
                  height: size.height * 0.44,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const TextMdBoldGrey800('Correo electrónico'),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: emailController,
                        validator: (text) => validateNotNull(text),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person_outline),
                          labelText: 'Correo electrónico',
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                        ),
                      ),
                      SizedBox(height: size.height * 0.05),
                      const TextMdBoldGrey800('Contraseña'),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: passwordController,
                        validator: (text) => validateNotNull(text),
                        obscureText: true,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock_outline),
                          labelText: 'Contraseña',
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                        ),
                      ),
                      const Spacer(),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            final isValid = _form.currentState!.validate();
                            if (!isValid) {
                              return;
                            }
                          },
                          icon: const Icon(Icons.chevron_left),
                          label: const Text('Iniciar Sesión'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
