import 'package:flutter/material.dart';

class Gap04 extends StatelessWidget {
  const Gap04({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.04,
        vertical: size.height * 0.04,
      ),
      child: child,
    );
  }
}
