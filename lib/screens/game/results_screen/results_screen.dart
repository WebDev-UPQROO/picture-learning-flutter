import 'package:flutter/material.dart';
import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/widgets/gaps/gap_04.dart';
import 'package:picture_learning/widgets/painters/painer_curve.dart';

import '../../../routes.dart';

//for storing form state.
class ResultsScreen extends StatelessWidget {
  ResultsScreen({Key? key}) : super(key: key);

  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: PageView(controller: _pageController, children: [
        SuccessScreen(
          imgOnTop: Image.asset(
            'assets/img/applauding_results.png',
            height: size.height * 0.53,
          ),
          onRight: 0.1,
          onTop: 0.03,
          isCrown: false,
          scoreText: '7/10',
          titleText: 'Congratulations',
          descText:
              'You have completed the "actions" \ntopic of the "Beginner" level.',
          onPressButton: () {
            _pageController.animateToPage(_pageController.page!.toInt() + 1,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeIn);
          },
        ),
        SuccessScreen(
          imgOnTop: Image.asset(
            'assets/img/crown_results.png',
            height: size.height * 0.22,
          ),
          onRight: 0.1,
          onTop: 0.16,
          isCrown: true,
          scoreText: '9/10',
          titleText: 'Congratulations',
          descText:
              'You have completed the "actions" \ntopic of the "Beginner" level.',
          onPressButton: () {
            //context.read<LocalService>().putFirstTime();
            _pageController.animateToPage(_pageController.page!.toInt() + 1,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeIn);
          },
        ),
        WrongScreen(
          imgOnTop: Image.asset(
            'assets/img/facepalm_results.png',
            height: size.height * 0.5,
          ),
          onRight: 0.12,
          onTop: 0.05,
          scoreText: '2/10',
          titleText: 'Sorry',
          descText:
              'It seems that you have not managed \nto complete the level, keep practicing.',
          onPressButton: () {
            //context.read<LocalService>().putFirstTime();
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

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    Key? key,
    required this.imgOnTop,
    required this.onRight,
    required this.onTop,
    required this.isCrown,
    required this.scoreText,
    required this.titleText,
    required this.descText,
    required this.onPressButton,
  }) : super(key: key);

  final Widget imgOnTop;
  final double onRight;
  final double onTop;
  final bool isCrown;
  final String scoreText;
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

          if(isCrown == true)(
            Positioned(
              top: size.height * 0.07, //pasar paametro de top
              child: Text(
                   'New crown',
              textAlign: TextAlign.center,
              style: TextStyle(
                     fontSize: 36,
                     color: Style.white,
                     fontWeight: FontWeight.bold,
                          ),
              ),
            )
          ),
      
          Positioned(
            right: size.width * onRight,
            top: size.height * onTop, //pasar paametro de top
            child: imgOnTop,
          ),
          
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: size.height * 0.51,
              width: size.width,
              child:
               CustomPaint(
                painter: PainterCurve(color: Style.white),
              ),
            ),
          ),
          
          SafeArea(
            child: Gap04(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                 
                  SizedBox(height: size.height * 0.3),
                    Container(
                    width: 150,
                    height: 150,
                    decoration: 
                    BoxDecoration(
                        shape: BoxShape.circle,
                        color: Style.white,
                        border: Border.all(
                              color: Style.primary,
                              width: 5,
                        ),
                         
                    ),
                    child: 
                    Center(
                      child: Text(
                      'Score \n7/10',
                      textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: Style.h3,
                          color: Style.grey800,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )                       
                  ),
            
                  Text(
                    titleText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Style.h2,
                      color: Style.success,
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
                      label: Text(
                        'Continuar',
                        textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: Style.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Style.success),
                    ),
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

class WrongScreen extends StatelessWidget {
  const WrongScreen({
    Key? key,
    required this.imgOnTop,
    required this.onRight,
    required this.onTop,
    required this.scoreText,
    required this.titleText,
    required this.descText,
    required this.onPressButton,
  }) : super(key: key);

  final Widget imgOnTop;
  final double onRight;
  final double onTop;
  final String scoreText;
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
          Positioned(
            right: size.width * onRight,
            top: size.height * onTop,
            child: imgOnTop,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: size.height * 0.51,
              width: size.width,
              child:
               CustomPaint(
                painter: PainterCurve(color: Style.white),
              ),
            ),
          ),
          
          SafeArea(
            child: Gap04(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                 
                  SizedBox(height: size.height * 0.3),
                    Container(
                    width: 150,
                    height: 150,
                    decoration: 
                    BoxDecoration(
                        shape: BoxShape.circle,
                        color: Style.white,
                        border: Border.all(
                              color: Style.primary,
                              width: 5,
                        ),
                         
                    ),
                    child: 
                    Center(
                      child: Text(
                      'Score \n7/10',
                      textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: Style.h3,
                          color: Style.grey800,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )                       
                  ),
            
                  Text(
                    titleText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Style.h2,
                      color: Style.wrong,
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
                      label: Text(
                        'Continuar',
                        textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: Style.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Style.wrong),
                    ),
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

