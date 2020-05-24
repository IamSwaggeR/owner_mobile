import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ownerapp/constAndString/string.dart';
import 'package:ownerapp/widgets/map/house_detail_map.dart';
import 'package:ownerapp/widgets/margin/margin_top.dart';
import 'package:ownerapp/widgets/navigation/buttomNavBar.dart';
import 'package:ownerapp/widgets/text/textTitle.dart';

class House extends StatelessWidget {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(11.591241, 104.917064),
    zoom: 15.4746,
  );

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: ButtomNavBar(
        isActiveHouse: true,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: size.height * 0.40,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(housePic), fit: BoxFit.cover),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                MarginTop(),
                TextTitle(
                  text: 'Room Available',
                ),
                MarginTop(),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5,
                              offset: Offset(3, 3),
                            )
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(vertical: 8),
                        height: 60,
                        child: Row(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  bottomLeft: Radius.circular(12),
                                ),
                              ),
                              width: 8,
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(12),
                                    bottomRight: Radius.circular(12),
                                  ),
                                ),
                                width: double.infinity,
                                height: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Room 102',
                                      style: TextStyle(
                                          color: Color.fromRGBO(63, 71, 99, 1),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '100\$',
                                      style: TextStyle(
                                          color: Colors.amber,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                MarginTop(),
                ListTile(
                  leading: Icon(
                    Icons.wifi,
                    color: Colors.amber,
                  ),
                  title: Text(
                    'Free WiFi',
//                        style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.local_parking,
                    color: Colors.amber,
                  ),
                  title: Text(
                    'Parking',
//                        style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                MarginTop(),
                TextTitle(
                  text: "House's Rules",
                ),
                MarginTop(),
                ListTile(
                    leading: Icon(
                      Icons.close,
                      color: Colors.amber,
                    ),
                    title: Text(
                      'Close Hour at 10pm',
//                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                MarginTop(),
                TextTitle(
                  text: 'House Description',
                ),
                MarginTop(),
                Text(
                  houseDes,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 15, height: 1.8),
                ),
                MarginTop(),
                TextTitle(
                  text: 'Location',
                ),
                MarginTop(),
                Container(
                  height: 120,
                  width: double.infinity,
                  child: Stack(
                    children: <Widget>[
                      Material(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: GoogleMap(
                          mapType: MapType.normal,
                          initialCameraPosition: _kGooglePlex,
                          markers: Set<Marker>.of(
                            [
                              Marker(
                                  markerId: MarkerId("0000"),
                                  position: LatLng(11.591241, 104.917064))
                            ],
                          ),
                          onMapCreated: (GoogleMapController controller) {
                            _controller.complete(controller);
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MapLocation(
                                    lat: 11.591241,
                                    long: 104.917064,
                                  )));
                        },
                        child: Container(
                          color: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
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
