import 'package:flutter/material.dart';
import 'package:flutter_app/components/markers/placeMarker.dart';
import 'package:flutter_app/data/api.dart';
import 'package:flutter_app/models/place.dart';
import 'package:flutter_map/flutter_map.dart';

class TramMarker {
  static const icon = Icons.tram;
  static const color = Colors.blue;
  final Place place;
  TramMarker({this.place});

  Marker widget(context) {
    return PlaceMarker(place: place, icon: icon, color: color).widget(context);
  }
}

class TramMarkers {
  final List<Place> places = API.tramPlaces;

  Iterable<Marker> widgets(BuildContext context) {
    return places.map((place) => TramMarker(place: place).widget(context));
  }
}
