import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picture_learning/models/services/local_service.dart';
import 'package:picture_learning/routes/routes_auth.dart';
import 'widgets/index.dart';

//for storing form state.
class WelcomeAppScreen extends StatelessWidget {
  WelcomeAppScreen({Key? key}) : super(key: key);

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
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur faucibus tempus diam non varius. Aenean imperdiet consectetur lorem.',
          onPressButton: () {
            _pageController.animateToPage(_pageController.page!.toInt() + 1,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeIn);
          },
          onPressedClose: () => closeWelcomeScreen(context),
        ),
        WelcomePage(
          imgOnTop: Image.asset(
            'assets/img/welcome_icon.png',
            height: size.height * 0.47,
          ),
          onRight: 0.24,
          titleText: 'Picture Learning',
          descText:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur faucibus tempus diam non varius. Aenean imperdiet consectetur lorem.',
          onPressButton: () {
            context.read<LocalService>().putFirstTime();
            Navigator.pushNamedAndRemoveUntil(
              context,
              RoutesAuth.loginOAuth,
              (Route<dynamic> route) => false,
            );
          },
          onPressedClose: () => closeWelcomeScreen(context),
        )
      ]),
    );
  }
}
