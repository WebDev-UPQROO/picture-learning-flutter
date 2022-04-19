import 'package:flutter/material.dart';
import 'package:picture_learning/constants/style.dart';
import 'package:picture_learning/utils/nullable.dart';
import 'package:picture_learning/widgets/text/index.dart';

class GameButtonsItem extends StatelessWidget {
  const GameButtonsItem({
    Key? key,
    required this.option,
    required this.isActive,
    required this.onPressed,
  }) : super(key: key);

  final String? option;
  final bool isActive;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isActive ? onPressed : null,
      child: TextH4BoldGrey800(
        isActive ? getString(option) : '??',
      ),
      style: ElevatedButton.styleFrom(
        elevation: 3,
        primary: Style.white,
        onPrimary: Style.primary,
      ),
    );
  }
}
