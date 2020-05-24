import 'package:flutter/material.dart';
import 'package:ownerapp/colors/color.dart';

class TextInputProfile extends StatelessWidget {
  const TextInputProfile({
    Key key, this.text, this.validate, this.controller, this.keyboardType,
  }) : super(key: key);
  final String text;
  final FormFieldValidator validate;
  final TextEditingController controller;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          ]
      ),
      child: TextFormField(
        validator: validate,
        controller: controller,
        decoration: InputDecoration(
          hintText: text,
          border: InputBorder.none,
          hintStyle: TextStyle(
            fontSize: 14,
          ),
        ),
        keyboardType: keyboardType,
      ),
    );
  }
}