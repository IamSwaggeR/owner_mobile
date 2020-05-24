import 'package:flutter/material.dart';
import 'package:ownerapp/colors/color.dart';


class ProfileCustomPaint extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final height = size.height;
    final width = size.width;
    Paint paint = new Paint();
    paint.color = appMainColor;
    canvas.drawRect(Rect.fromPoints(Offset.zero, Offset(width, height*0.5)), paint);
    Path overPath = new Path();
    overPath.quadraticBezierTo(0, 0, width, height*0.5);
    overPath.lineTo(0, height);
    overPath.close();

    paint.color =  appMainColor;
    canvas.drawPath(overPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}