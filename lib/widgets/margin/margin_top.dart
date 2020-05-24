import 'package:flutter/material.dart';

class MarginTop extends StatelessWidget {
  const MarginTop({
    Key key,
    this.height = 16.0,
  }) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}
