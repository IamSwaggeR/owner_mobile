import 'package:flutter/material.dart';
import 'package:ownerapp/colors/color.dart';


class LoginCustomPaint extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final height = size.height;
    final width = size.width;
    Paint paint = new Paint();
    paint.color = appMainColor;
    canvas.drawRect(Rect.fromPoints(Offset.zero, Offset(width*0.5, height)), paint);
    Path overPath = new Path();
    overPath.moveTo(width*0.5, height);
    overPath.quadraticBezierTo(width, height, width, 0);
    overPath.lineTo(width*0.1, 0);
    overPath.close();

    paint.color =  appMainColor;
    canvas.drawPath(overPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}