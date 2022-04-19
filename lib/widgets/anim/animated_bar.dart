import 'package:flutter/material.dart';
import 'package:picture_learning/constants/style.dart';

class AnimatedBar extends AnimatedWidget {
  const AnimatedBar({
    required AnimationController controller,
    Key? key,
  }) : super(key: key, listenable: controller);

  Animation<double> get _progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.symmetric(
        horizontal: size.width * 0.04,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(100),
        ),
      ),
      child: LinearProgressIndicator(
        backgroundColor: Colors.white38,
        color: Style.secondary,
        value: _progress.value,
        minHeight: 10,
      ),
    );
  }
}
