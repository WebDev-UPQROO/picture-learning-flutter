import 'package:flutter/material.dart';
import 'package:picture_learning/constants/style.dart';

class TextMdW500lGrey600 extends StatelessWidget {
  const TextMdW500lGrey600(
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
        fontWeight: FontWeight.w500,
        color: Style.grey600,
      ),
    );
  }
}
