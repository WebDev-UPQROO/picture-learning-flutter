import 'package:animated_widgets/animated_widgets.dart';
import 'package:flutter/material.dart';
import 'package:picture_learning/models/game/index.dart';

class GameImage extends StatelessWidget {
  const GameImage({
    Key? key,
    required this.isActive,
    required this.errorEnable,
    required this.question,
  }) : super(key: key);

  final bool isActive;
  final bool errorEnable;
  final Exercise? question;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Image defaultImage = Image.asset(
      'assets/img/question.jpg',
      height: size.height * 0.3,
      width: size.width,
      fit: BoxFit.cover,
    );

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
        child: isActive
            ? Image.network(
                question!.image!,
                height: size.height * 0.3,
                width: size.width,
                fit: BoxFit.cover,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return const Text('😢');
                },
              )
            : defaultImage,
      ),
    );
  }
}
