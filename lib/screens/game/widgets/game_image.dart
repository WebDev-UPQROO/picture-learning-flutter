import 'package:animated_widgets/animated_widgets.dart';
import 'package:flutter/material.dart';

import 'package:picture_learning/models/game/index.dart';
import 'package:picture_learning/utils/game.dart';

class GameImage extends StatelessWidget {
  const GameImage({
    Key? key,
    required this.progressStatus,
    required this.errorEnable,
    required this.question,
  }) : super(key: key);

  final ProgressStatus progressStatus;
  final bool errorEnable;
  final Exercise? question;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ShakeAnimatedWidget(
      enabled: errorEnable,
      duration: const Duration(milliseconds: 200),
      shakeAngle: Rotation.deg(z: 5),
      curve: Curves.linear,
      child: Material(
        elevation: 10,
        clipBehavior: Clip.hardEdge,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        child: isPlaying(progressStatus)
            ? Image.network(
                question!.image!,
                height: size.height * 0.3,
                width: size.width,
                fit: BoxFit.cover,
              )
            : Image.asset(
                'assets/img/question.jpg',
                height: size.height * 0.3,
                width: size.width,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
