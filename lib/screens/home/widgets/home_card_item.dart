import 'package:flutter/material.dart';
import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/models/game/index.dart';
import 'package:picture_learning/routes/routes_game.dart';
import 'package:picture_learning/utils/nullable.dart';

class HomeCardItem extends StatelessWidget {
  const HomeCardItem({
    Key? key,
    required this.topic,
    required this.isPerfect,
    required this.pressEffect,
    this.gameFinished,
  }) : super(key: key);

  final Topic topic;
  final bool isPerfect;
  final Function() pressEffect;
  final Function()? gameFinished;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96,
      height: 96,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(100),
        ),
        border: Border.all(
          width: 2,
          color: isPerfect ? Style.primary : Style.grey200,
        ),
      ),
      child: InkWell(
        onTap: () {
          pressEffect();
          Navigator.pushNamed(
            context,
            RoutesGame.game,
            arguments: GameUI(
              uid: topic.uid!,
              name: topic.name,
            ),
          ).then((value) {
            if (gameFinished != null) {
              gameFinished!();
            }
          });
        },
        borderRadius: BorderRadius.circular(100),
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isNotEmpty(topic.image)
                    ? Image.network(
                        topic.image!,
                        width: 40,
                        height: 40,
                      )
                    : Image.asset(
                        'assets/img/card_icon.png',
                        width: 40,
                        height: 40,
                      ),
                const SizedBox(height: 8),
                Text(getString(topic.name)),
              ],
            ),
            if (isPerfect)
              Positioned(
                top: 72,
                child: Image.asset(
                  'assets/icons/crown.png',
                  width: 32,
                  height: 32,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
