import 'package:flutter/material.dart';

class DashBoardToday extends StatelessWidget {
  DashBoardToday({this.textLeft, this.textRight});

  final String textLeft;
  final int textRight;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            this.textLeft,
            style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          Text(
            '$textRight',
            style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
