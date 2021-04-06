import 'package:flutter/material.dart';
import 'package:flutter_app/components/markers/transports/busMarkers.dart';
import 'package:flutter_app/components/markers/transports/carpoolingMarkers.dart';
import 'package:flutter_app/components/markers/transports/scooterMarkers.dart';
import 'package:flutter_app/components/markers/transports/tramMarkers.dart';
import 'package:flutter_app/components/markers/userMarker.dart';
import 'package:flutter_app/components/markers/workspaceMarkers.dart';
import 'package:flutter_app/data/api.dart';
import 'package:flutter_map/flutter_map.dart';

class Workspaces extends StatelessWidget {
  const Workspaces({Key key}) : super(key: key);

  static const String route = 'workspaces';
  // static LatLng paris = LatLng(48.8566, 2.3522);

  @override
  Widget build(BuildContext context) {
    List<Marker> markers = [
      UserMarker().widget(context),
      ...WorkspaceMarkers().widgets(context),
      ...BusMarkers().widgets(context),
      ...CarpoolingMarkers().widgets(context),
      ...ScooterMarkers().widgets(context),
      ...TramMarkers().widgets(context)
    ];
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          center: API.currentUserLocation,
          zoom: 13.0,
        ),
        layers: [
          TileLayerOptions(
              urlTemplate:
                  "https://server.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}",
              // urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c']),
          MarkerLayerOptions(markers: markers),
        ],
      ),
    );
  }
}
