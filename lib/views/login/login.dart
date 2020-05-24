import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:ownerapp/colors/color.dart';
import 'package:ownerapp/constAndString/const.dart';
import 'package:ownerapp/constAndString/string.dart';
import 'package:ownerapp/views/login/verifyCode.dart';
import 'package:ownerapp/views/scopedModel/apiScopedModel.dart';
import 'package:ownerapp/widgets/login/bedroomButtomOpacity.dart';
import 'package:ownerapp/widgets/login/topShape.dart';
import 'package:ownerapp/widgets/validate/validatePhone.dart';

import 'package:toast/toast.dart';


class Login extends StatelessWidget {
  TextEditingController phoneNumberController = TextEditingController(text: "011352185");

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
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    loginOrRegister,
                    style: TextStyle(
                      color: appMainColor,
                      fontSize: 18,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(left: 20),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 8,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.amber,
                          ),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: TextFormField(
                          controller: phoneNumberController,
                          validator: validatePhone,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10),
                          ],
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 15),
                            border: InputBorder.none,
                            hintText: phoneNumber,
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        final result = await ApiScopedModel.of(context)
                            .logUserIn(phoneNumberController.text);
                        if (result == REQUEST_SUCCESS) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => VerifyCode(
                                phoneNumber: phoneNumberController.text,
                              ),
                            ),
                          );
                        } else if (result == REQUEST_FAIL) {
                          Toast.show("Something went wrong. Please try again.",
                              context,
                              duration: Toast.LENGTH_LONG,
                              gravity: Toast.BOTTOM);
                        } else {
                          Toast.show("$result", context,
                              duration: Toast.LENGTH_LONG,
                              gravity: Toast.BOTTOM);
                        }
                      },
                      icon: Icon(Feather.chevron_right),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
