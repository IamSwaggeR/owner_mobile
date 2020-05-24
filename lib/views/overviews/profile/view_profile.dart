import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ownerapp/colors/color.dart';
import 'package:ownerapp/constAndString/string.dart';
import 'package:ownerapp/widgets/button/click_button.dart';
import 'package:ownerapp/widgets/margin/margin_top.dart';
import 'package:ownerapp/widgets/navigation/buttomNavBar.dart';
import 'package:ownerapp/widgets/overviews/profile/text_profile.dart';

import 'edit_profile.dart';

class ViewProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: appColor,
      bottomNavigationBar: ButtomNavBar(
        isActiveProfile: true,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 260,
            width: double.infinity,
            decoration: BoxDecoration(
              color: appMainColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            alignment: Alignment.center,
            child: Material(
              shape: CircleBorder(),
              clipBehavior: Clip.antiAlias,
              child: Container(
                height: 160,
                width: 160,
                child: SvgPicture.asset(account_pic_null),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                MarginTop(),
                TextProfile(
                  textLeft: first_name,
                  textRight: 'Soley',
                ),
                MarginTop(),
                TextProfile(
                  textLeft: last_name,
                  textRight: 'Sok',
                ),
                MarginTop(),
                TextProfile(
                  textLeft: national_ID,
                  textRight: '0120901293',
                ),
                MarginTop(),
                TextProfile(
                  textLeft: gender,
                  textRight: 'Male',
                ),
                MarginTop(),
                TextProfile(
                  textLeft: phone_number,
                  textRight: '011352185',
                ),
                MarginTop(),
                ClickButton(
                  text: 'Edit Profile',
                  press: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return EditProfile();
                    }));
                  },
                ),
                MarginTop(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




