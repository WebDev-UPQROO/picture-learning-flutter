import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/widgets/gaps/gap_04.dart';
import 'package:picture_learning/widgets/painters/painer_curve.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({
    Key? key,
    required this.imgOnTop,
    required this.onRight,
    required this.titleText,
    required this.descText,
    required this.onPressButton,
    required this.onPressedClose,
  }) : super(key: key);

  final Widget imgOnTop;
  final double onRight;
  final String titleText;
  final String descText;
  final Function() onPressButton;
  final Function() onPressedClose;

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
                  onPressed: onPressedClose,
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
