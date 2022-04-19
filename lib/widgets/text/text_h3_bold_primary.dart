import 'package:flutter/material.dart';
import 'package:picture_learning/constants/style.dart';

class TextH1BoldWhite extends StatelessWidget {
  const TextH1BoldWhite(
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
        fontSize: Style.h1,
        fontWeight: FontWeight.bold,
        color: Style.white,
      ),
    );
  }
}
