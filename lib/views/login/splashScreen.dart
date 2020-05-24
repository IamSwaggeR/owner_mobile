import 'package:flutter/material.dart';
import 'package:ownerapp/colors/color.dart';
import 'package:ownerapp/constAndString/string.dart';
import 'package:ownerapp/widgets/login/bedroomButtomOpacity.dart';

import 'login.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initAppData();
  }

  initAppData() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appMainColor,
      body: Stack(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  rental,
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 46,
                  ),
                ),
                Text(
                  rentalDescription,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          BedRoomButtomOpacity(),
        ],
      ),
    );
  }
}
