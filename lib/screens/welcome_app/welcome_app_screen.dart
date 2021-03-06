import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picture_learning/models/services/local_service.dart';
import 'package:picture_learning/routes/routes_auth.dart';
import 'widgets/index.dart';

//for storing form state.
class WelcomeAppScreen extends StatelessWidget {
  WelcomeAppScreen({Key? key}) : super(key: key);

  //Remove splash screen from reappearing for first time and close the screen
  void closeWelcomeScreen(BuildContext context) {
    context.read<LocalService>().putFirstTime();

    Navigator.pushNamedAndRemoveUntil(
      context,
      RoutesAuth.loginOAuth,
      (Route<dynamic> route) => false,
    );
  }

  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: PageView(controller: _pageController, children: [
        WelcomePage(
          imgOnTop: Image.asset(
            'assets/img/welcome_man.png',
            height: size.height * 0.43,
          ),
          onRight: 0.15,
          titleText: 'Bienvenido',
          descText:
              'Aprende nuevas palabras en ingles con solo ver, enfócate en el vocabulario de un área especifica de trabajo o estudio y supera todos los niveles que tenemos disponibles para ti.',
          onPressButton: () {
            //Go to the next page of the pageview
            _pageController.animateToPage(_pageController.page!.toInt() + 1,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeIn);
          },
          onPressedClose: () => closeWelcomeScreen(context),
        ),
        WelcomePage(
          imgOnTop: Image.asset(
            'assets/img/screen_example.png',
            height: size.height * 0.47,
          ),
          onRight: 0.26,
          titleText: 'Picture Learning',
          descText:
              'Jugar Picture Learning es muy sencillo, solo dale click a la opcion que creas correcta, no olvides medir tu tiempo. Mucha suerte 😉',
          onPressButton: () => closeWelcomeScreen(context),
          onPressedClose: () => closeWelcomeScreen(context),
        )
      ]),
    );
  }
}
