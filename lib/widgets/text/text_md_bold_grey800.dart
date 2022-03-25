import 'package:flutter/material.dart';
import 'package:picture_learning/constants/style.dart';

class TextMdBoldGrey800 extends StatelessWidget {
  const TextMdBoldGrey800(
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
        fontSize: Style.textmd,
        fontWeight: FontWeight.bold,
        color: Style.grey800,
      ),
    );
  }
}
