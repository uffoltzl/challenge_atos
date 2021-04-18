import 'package:flutter/material.dart';
import 'package:flutter_app/data/api.dart';
import 'package:flutter_app/models/place.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class UserMarker {
  UserMarker();

  static LatLng currentUserLocation = API.currentUserLocation;
  static final color = Colors.blue[600];

  Marker widget(BuildContext context) {
    return Marker(
        width: 20.0,
        height: 20.0,
        point: currentUserLocation,
        builder: (ctx) => Container(
                child: RawMaterialButton(
              onPressed: () {},
              elevation: 2.0,
              fillColor: color,
              // padding: EdgeInsets.all(5.0),
              shape: CircleBorder(),
            )));
  }
}
