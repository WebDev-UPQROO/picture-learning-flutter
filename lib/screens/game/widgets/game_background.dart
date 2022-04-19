import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/widgets/painters/painer_curve.dart';

late ConfettiController confettiController;

class GameBackground extends StatefulWidget {
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
  State<GameBackground> createState() => _GameBackgroundState();
}

class _GameBackgroundState extends State<GameBackground> {
  @override
  void initState() {
    confettiController = ConfettiController(
      duration: const Duration(milliseconds: 500),
    );
    super.initState();
  }

  @override
  void dispose() {
    confettiController.dispose();
    super.dispose();
  }

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
        widget.game,
        widget.progressBar,
        widget.initalScreen,
        Align(
          alignment: Alignment.topCenter,
          child: ConfettiWidget(
            maxBlastForce: 100,
            numberOfParticles: 30,
            blastDirectionality: BlastDirectionality.explosive,
            blastDirection: -80,
            confettiController: confettiController,
            gravity: 1,
            colors: [Style.success],
          ),
        ),
      ],
    );
  }
}
