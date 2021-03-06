import 'package:flutter/material.dart';
import 'package:picture_learning/constants/style.dart';

class TextH3BoldPrimary extends StatelessWidget {
  const TextH3BoldPrimary(
    this.child, {
    Key? key,
    this.textAlign,
  }) : super(key: key);

  final String child;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      child,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: Style.h3,
        fontWeight: FontWeight.bold,
        color: Style.primary,
      ),
    );
  }
}
