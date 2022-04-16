import 'package:flutter/material.dart';
import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/widgets/painters/painer_curve.dart';

class GameBackground extends StatelessWidget {
  const GameBackground({
    Key? key,
    required this.game,
    required this.initalScreen,
    required this.progressBar,
  }) : super(key: key);

  final Widget game;
  final Widget initalScreen;
  final Widget progressBar;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            height: size.height * 0.4,
            width: size.width,
            child: CustomPaint(
              painter: HeaderCurve(color: Style.primary),
            ),
          ),
        ),
        game,
        progressBar,
        initalScreen,
      ],
    );
  }
}
