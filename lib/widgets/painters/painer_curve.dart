import 'package:flutter/material.dart';

class PainterCurve extends CustomPainter {
  final Color color;

  PainterCurve({required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = color;
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height * 0.1);
    path.quadraticBezierTo(
      size.width / 2,
      0,
      size.width,
      size.height * 0.1,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
