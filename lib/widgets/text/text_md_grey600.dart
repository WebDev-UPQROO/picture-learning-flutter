import 'package:flutter/material.dart';
import 'package:picture_learning/constants/style.dart';

class TextMdGrey600 extends StatelessWidget {
  const TextMdGrey600(
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
        color: Style.grey600,
      ),
    );
  }
}
