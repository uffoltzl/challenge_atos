import 'package:flutter/material.dart';
import 'package:flutter_app/components/markers/placeMarker.dart';
import 'package:flutter_app/data/api.dart';
import 'package:flutter_app/models/place.dart';
import 'package:flutter_map/flutter_map.dart';

class BusMarker {
  static const icon = Icons.directions_bus;
  static const color = Colors.blue;
  final Place place;
  BusMarker({this.place});

  Marker widget(context) {
    return PlaceMarker(place: place, icon: icon, color: color).widget(context);
  }
}

class BusMarkers {
  final List<Place> places = API.busPlaces;

  Iterable<Marker> widgets(BuildContext context) {
    return places.map((place) => BusMarker(place: place).widget(context));
  }
}
