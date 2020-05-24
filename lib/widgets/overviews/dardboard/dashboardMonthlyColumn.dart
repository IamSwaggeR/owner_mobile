import 'package:flutter/material.dart';
import 'package:ownerapp/colors/color.dart';

class DashBoardMonthlyColumn extends StatelessWidget {
  DashBoardMonthlyColumn({@required this.topText,@required this.buttomText, this.marginLeft=0, this.marginRight=0});

  final String topText;
  final int buttomText;
  final double marginLeft;
  final double marginRight;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: this.marginLeft,right: this.marginRight),
      width: double.infinity,
      height: 140,
      decoration: BoxDecoration(
        color: appMainColor,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            this.topText,
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.amber,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "$buttomText",
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.white,
              fontSize: 32,
            ),
          )
        ],
      ),
    );
  }
}
