import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class Workspaces extends StatelessWidget {
  const Workspaces({Key key}) : super(key: key);

  static const String route = 'workspaces';
  static LatLng paris = LatLng(48.8566, 2.3522);
  // TODO :
  // Animated MapController / onTap
  // Tile builder => Afficher certains points (métros, bus, velib)

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: paris,
        zoom: 13.0,
      ),
      layers: [
        TileLayerOptions(
            urlTemplate:
                "https://server.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}",
            // urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']),
        MarkerLayerOptions(markers: [
          Marker(
            width: 80.0,
            height: 80.0,
            point: paris,
            builder: (ctx) => Container(
              child: FlutterLogo(),
            ),
          ),
        ]),
      ],
    );
  }
}
