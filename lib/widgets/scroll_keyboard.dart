import 'package:flutter/material.dart';

class ScrollKeyboard extends StatelessWidget {
  const ScrollKeyboard({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: SizedBox(
        height: size.height,
        child: child,
      ),
    );
  }
}
