import 'package:flutter/material.dart';
import 'package:ownerapp/colors/color.dart';

class ClickButton extends StatelessWidget {
  const ClickButton({
    Key key, this.text, this.press,
  }) : super(key: key);
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.symmetric(horizontal: 40,vertical: 12),
//      textColor: Colors.amber,
      onPressed: press,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Text(text,style: TextStyle(
        color: Colors.amber
      ),),
      color: appMainColor,
    );
  }
}