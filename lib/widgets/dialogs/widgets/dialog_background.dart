import 'package:flutter/material.dart';

class DialogBackground extends StatelessWidget {
  final Widget child;

  const DialogBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: child,
    );
  }
}
