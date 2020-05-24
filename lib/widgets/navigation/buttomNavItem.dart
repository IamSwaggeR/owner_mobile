import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ownerapp/colors/color.dart';

class ButtomNavItem extends StatelessWidget {
  const ButtomNavItem({
    Key key,
    this.svg,
    this.text,
    this.press,
    this.isActive = false,
  }) : super(key: key);

  final String svg;
  final String text;
  final Function press;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: press,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SvgPicture.asset(
                svg,
                height: 18,
                width: 18,
                color: isActive ? appMainColor : Colors.black45,
              ),
              Text(
                text,
                style: TextStyle(
                  color: isActive ? appMainColor : Colors.black45,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
