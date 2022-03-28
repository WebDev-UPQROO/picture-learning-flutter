import 'dart:ui';
import 'package:flutter/material.dart';

class DialogBackground extends StatelessWidget {
  final Widget child;

  const DialogBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 10,
        sigmaY: 10,
      ),
      child: Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: child,
      ),
    );
  }
}
