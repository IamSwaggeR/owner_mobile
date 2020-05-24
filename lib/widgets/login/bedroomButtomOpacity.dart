import 'package:flutter/material.dart';

class BedRoomButtomOpacity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Opacity(
        opacity: 0.4,
        child: Image.asset('lib/assets/pngs/bedroom.png',),
      ),
    );
  }
}
