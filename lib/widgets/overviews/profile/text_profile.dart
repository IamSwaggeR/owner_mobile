import 'package:flutter/material.dart';
import 'package:ownerapp/colors/color.dart';

class TextProfile extends StatelessWidget {
  const TextProfile({
    Key key, this.textLeft, this.textRight,
  }) : super(key: key);

  final String textLeft;
  final String textRight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
                offset: Offset(1, 1),
                spreadRadius: -6,
                blurRadius: 10,
                color: appMainColor),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            textLeft,
            style: TextStyle(color: Colors.grey),
          ),
          Text(textRight),
        ],
      ),
    );
  }
}