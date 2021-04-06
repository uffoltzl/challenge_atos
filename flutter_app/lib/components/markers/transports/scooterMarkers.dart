import 'package:flutter/material.dart';
import 'package:flutter_app/components/markers/placeMarker.dart';
import 'package:flutter_app/data/api.dart';
import 'package:flutter_app/models/place.dart';
import 'package:flutter_map/flutter_map.dart';

class ScooterMarker {
  static const icon = Icons.electric_scooter;
  static const color = Colors.blue;
  final Place place;
  ScooterMarker({this.place});

  Marker widget(context) {
    return PlaceMarker(place: place, icon: icon, color: color).widget(context);
  }
}

class ScooterMarkers {
  final List<Place> places = API.scooterPlaces;

  Iterable<Marker> widgets(BuildContext context) {
    return places.map((place) => ScooterMarker(place: place).widget(context));
  }
}
