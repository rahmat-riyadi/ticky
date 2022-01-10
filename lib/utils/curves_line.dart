import 'dart:math';
import 'package:flutter/material.dart';

class CurvesLine extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    Path path = Path();
    Path path2 = Path();

    path.quadraticBezierTo(size.width * 0.5, -size.height * 5, size.width, 0);

    Paint line = Paint()
    ..color = Colors.white
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2;

    canvas.drawPath(path, line);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

}