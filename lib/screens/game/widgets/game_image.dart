import 'package:flutter/material.dart';
import 'package:picture_learning/models/game/index.dart';

class GameImage extends StatelessWidget {
  const GameImage({
    Key? key,
    required this.gameStatus,
    required this.question,
  }) : super(key: key);

  final GameStatus gameStatus;
  final Exercise? question;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Material(
      elevation: 10,
      clipBehavior: Clip.hardEdge,
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
      child: gameStatus == GameStatus.active
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
    );
  }
}
