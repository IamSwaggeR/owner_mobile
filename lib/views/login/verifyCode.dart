import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ownerapp/colors/color.dart';
import 'package:ownerapp/widgets/login/bedroomButtomOpacity.dart';
import 'package:ownerapp/widgets/login/topShape.dart';

import 'package:toast/toast.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class VerifyCode extends StatefulWidget {
  VerifyCode({this.phoneNumber=""});

  final String phoneNumber;

  @override
  _VerifyCodeState createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  String currentText = "";
  TextEditingController verifyCodeController = TextEditingController();
  static PinBoxDecoration underlinedPinBoxDecoration = (
      Color borderColor,
      Color pinBoxColor, {
        double borderWidth = 2.0,
        double radius,
      }) {
    return BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: borderColor,
          width: borderWidth,
        ),
      ),
    );
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        color: appColor,
        child: Stack(
          children: <Widget>[
            BedRoomButtomOpacity(),
            Column(
              children: <Widget>[
                TopShape(),
                Container(
                  margin: EdgeInsets.only(top: 32),
                  child: Text(
                    'Enter Verification Code',
                    style: TextStyle(
                      color: appMainColor,
                      fontSize: 22,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  PinCodeTextField(
                    wrapAlignment: WrapAlignment.center,
                    controller: verifyCodeController,
                    keyboardType: TextInputType.number,
                    pinBoxColor: Colors.transparent,
                    pinBoxRadius: 12,
                    pinBoxBorderWidth: 0,
                    maxLength: 4,
                    pinTextStyle: TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                    pinBoxDecoration: underlinedPinBoxDecoration,
                    onTextChanged: (value) {
                      setState(() {
                        currentText = value;
                      });
                    },
                  ),
                  RaisedButton(
                    onPressed: () async {
//                      final result = await ApiScopedModel.of(context)
//                          .VerifyPhoneNumber(
//                          widget.phoneNumber, verifyCodeController.text);
//                      if (result == REQUEST_SUCCESS) {
//                        Navigator.of(context).popUntil((Route<dynamic> r) => r.isFirst);
//                        Navigator.of(context).pushReplacement(
//                          MaterialPageRoute(
//                            builder: (context) => DashBoard(),
//                          ),
//                        );
//                        Toast.show("Success", context,
//                            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
//                      } else if (result == REQUEST_FAIL) {
//                        Toast.show(
//                            "Something went wrong. Please try again.", context,
//                            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
//                      } else {
//                        Toast.show("$result", context,
//                            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
//                      }
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                    ),
                    color: appMainColor,
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Didn\'t receive your code? ',
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: "Resend Code",
                          style: TextStyle(
                              color: Colors.amber, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
