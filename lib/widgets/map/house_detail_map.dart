import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapLocation extends StatefulWidget {
  MapLocation({this.lat,this.long});
  final double lat;
  final double long;

  @override
  _MapLocation createState() => _MapLocation();
}

class _MapLocation extends State<MapLocation> {
  Completer<GoogleMapController> _controller = Completer();
  @override
  Widget build(BuildContext context) {
    final CameraPosition _location = CameraPosition(
      target: LatLng(widget.lat,widget.long),
      zoom: 16.4746,
    );
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _location,
            markers: Set<Marker>.of(
              [
                Marker(markerId: MarkerId("0000"), position:LatLng(widget.lat,widget.long) )
              ],
            ),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
              child: BackButton(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
