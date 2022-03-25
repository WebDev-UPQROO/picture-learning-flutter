import 'package:flutter/material.dart';
import 'package:picture_learning/constants/style.dart';

class ElevatedButtonIconWhite extends StatelessWidget {
  const ElevatedButtonIconWhite({
    Key? key,
    required this.icon,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  final Widget label;
  final Widget icon;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon,
      label: label,
      style: ElevatedButton.styleFrom(
        primary: Style.white,
        onPrimary: Style.grey800,
      ),
    );
  }
}
