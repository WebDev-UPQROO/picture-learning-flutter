import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/models/services/local_service.dart';
import 'package:picture_learning/widgets/gaps/gap_04.dart';
import 'package:picture_learning/widgets/painters/painer_curve.dart';

import '../../routes.dart';

//for storing form state.
class WelcomeAppScreen extends StatelessWidget {
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: PageView(controller: _pageController, children: [
        WelcomePages(
          imgOnTop: Image.asset(
            'assets/img/welcome_man.png',
            height: size.height * 0.43,
          ),
          onRight: 0.07,
          titleText: 'Bienvenido',
          descText:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur faucibus tempus diam non varius. Aenean imperdiet consectetur lorem.',
          onPressButton: () {
            _pageController.animateToPage(_pageController.page!.toInt() + 1,
                duration: Duration(milliseconds: 400), curve: Curves.easeIn);
          },
        ),
        WelcomePages(
          imgOnTop: Image.asset(
            'assets/img/welcome_icon.png',
            height: size.height * 0.47,
          ),
          onRight: 0.18,
          titleText: 'Picture Learning',
          descText:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur faucibus tempus diam non varius. Aenean imperdiet consectetur lorem.',
          onPressButton: () {
            context.read<LocalService>().putFirstTime();
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.loginOAuth,
              (Route<dynamic> route) => false,
            );
          },
        )
      ]),
    );
  }
}

class WelcomePages extends StatelessWidget {
  const WelcomePages({
    Key? key,
    required this.imgOnTop,
    required this.onRight,
    required this.titleText,
    required this.descText,
    required this.onPressButton,
  }) : super(key: key);

  final Widget imgOnTop;
  final double onRight;
  final String titleText;
  final String descText;
  final Function() onPressButton;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Style.primary,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
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
          Positioned(
            right: size.width * 0.07,
            top: size.height * 0.02,
            child: SizedBox(
                height: 36.0,
                width: 36.0,
                child: IconButton(
                  onPressed: () {
                    context.read<LocalService>().putFirstTime();

                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes.loginOAuth,
                      (Route<dynamic> route) => false,
                    );
                  },
                  icon: const Icon(Icons.highlight_off,
                      size: 36.0, color: Colors.white),
                )),
          ),
          Positioned(
            right: size.width * onRight,
            top: size.height * 0.08,
            child: imgOnTop,
          ),
          SafeArea(
            child: Gap04(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: size.height * 0.45),
                  Text(
                    titleText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Style.h2,
                      color: Style.grey800,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    descText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Style.h4,
                      color: Style.grey600,
                      fontWeight: FontWeight.w500,
                      height: 1.7,
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: ElevatedButton.icon(
                      onPressed: onPressButton,
                      icon: const Icon(Icons.chevron_left),
                      label: const Text('Siguiente'),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
