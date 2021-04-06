import 'package:flutter/material.dart';
import 'package:flutter_app/components/markers/placeMarker.dart';
import 'package:flutter_app/data/api.dart';
import 'package:flutter_app/models/place.dart';
import 'package:flutter_map/flutter_map.dart';

class CarpoolingMarker {
  static const icon = Icons.hail;
  static const color = Colors.blue;
  final Place place;
  CarpoolingMarker({this.place});

  Marker widget(context) {
    return PlaceMarker(place: place, icon: icon, color: color).widget(context);
  }
}

class CarpoolingMarkers {
  final List<Place> places = API.carpoolingPlaces;

  Iterable<Marker> widgets(BuildContext context) {
    return places
        .map((place) => CarpoolingMarker(place: place).widget(context));
  }
}
