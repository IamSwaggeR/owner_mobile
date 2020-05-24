import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:ownerapp/constAndString/string.dart';
import 'package:ownerapp/views/overviews/dashboard.dart';
import 'package:ownerapp/views/overviews/house.dart';
import 'file:///D:/niptict/project/it_project/rental_mobile_owner/owner_app/lib/views/overviews/profile/view_profile.dart';

import 'buttomNavItem.dart';

class ButtomNavBar extends StatelessWidget {

  const ButtomNavBar({
    Key key, this.isActiveDashBoard=false, this.isActiveHouse=false, this.isActiveProfile=false,
  }) : super(key: key);
  final bool isActiveDashBoard;
  final bool isActiveHouse;
  final bool isActiveProfile;

  @override
  Widget build(BuildContext context) {
    return Container(
//      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      height: 60,
      color: Colors.white,
      child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: ButtomNavItem(
              svg: dashBoardSvg,
              text: dashboard,
              isActive: isActiveDashBoard,
              press: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                  return DashBoard();
                }));
              },
            ),
          ),
          Expanded(
            child: ButtomNavItem(
              svg: houseSvg,
              text: 'House',
              press: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                  return House();
                }));
              },
              isActive: isActiveHouse,
            ),
          ),
          Expanded(
            child: ButtomNavItem(
              svg : profileSvg,
              text: 'Profile',
              press: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                  return ViewProfile();
                }));
              },
              isActive: isActiveProfile,
            ),
          ),
        ],
      ),
    );
  }
}