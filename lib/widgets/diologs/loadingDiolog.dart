import 'package:flutter/material.dart';

class LoadingDiolog extends StatelessWidget {
  const LoadingDiolog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(0, 0, 0, 0.03),
      child: Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}