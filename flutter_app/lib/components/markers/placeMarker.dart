import 'package:flutter/material.dart';
import 'package:flutter_app/models/place.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class PlaceMarker {
  final Place place;
  final IconData icon;
  final Color color;

  PlaceMarker({this.place, this.icon, this.color});

  Marker widget(BuildContext context) {
    return Marker(
        width: 30.0,
        height: 30.0,
        point: LatLng(place.lat, place.lng),
        builder: (ctx) => Container(
                child: RawMaterialButton(
              onPressed: () {},
              elevation: 2.0,
              fillColor: color,
              child: Icon(
                icon,
                size: 15.0,
              ),
              // padding: EdgeInsets.all(5.0),
              shape: CircleBorder(),
            )));
  }
}
