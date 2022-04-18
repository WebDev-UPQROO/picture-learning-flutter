import 'package:flutter/material.dart';
import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/models/game/index.dart';
import 'package:picture_learning/utils/game.dart';
import 'package:picture_learning/utils/null_helper.dart';
import 'package:picture_learning/widgets/text/index.dart';

class GameButtonsItem extends StatelessWidget {
  const GameButtonsItem({
    Key? key,
    required this.option,
    required this.progressStatus,
    required this.onPressed,
  }) : super(key: key);

  final String? option;
  final ProgressStatus progressStatus;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: TextH4BoldGrey800(
        isPlaying(progressStatus) ? getString(option) : '??',
      ),
      style: ElevatedButton.styleFrom(
        elevation: 3,
        primary: Style.white,
        onPrimary: Style.primary,
      ),
    );
  }
}
