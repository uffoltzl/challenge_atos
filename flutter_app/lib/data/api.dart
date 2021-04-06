import 'package:flutter_app/models/place.dart';
import 'package:flutter_app/models/workspace.dart';
import 'package:flutter_app/data/carpoolingPlaces.dart';
import 'package:flutter_app/data/scooterPlaces.dart';
import 'package:flutter_app/data/tramPlaces.dart';
import 'package:flutter_app/data/busPlaces.dart';
import 'package:flutter_app/data/workspaces.dart';
import 'package:latlong/latlong.dart';

class API {
  static LatLng currentUserLocation = LatLng(48.8566, 2.3522);

  static List<Workspace> workspaces = Workspaces;

  static List<Place> busPlaces = BusPlaces;
  static List<Place> carpoolingPlaces = CarpoolingPlaces;
  static List<Place> scooterPlaces = ScooterPlaces;
  static List<Place> tramPlaces = TramPlaces;
}
