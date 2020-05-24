import 'package:flutter/material.dart';
import 'package:ownerapp/constAndString/string.dart';
import 'package:ownerapp/widgets/customPaints/loginCustomPaint.dart';

class TopShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: double.infinity,
      child: CustomPaint(
        painter: LoginCustomPaint(),
        child: Container(
          margin: EdgeInsets.only(left: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                rental,
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 42,
                  decoration: TextDecoration.none,
                ),
              ),
              Text(
                rentalDescription,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
