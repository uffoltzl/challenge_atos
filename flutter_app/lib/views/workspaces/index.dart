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
  // static const userIcon = ;
  // // User icon => Blue circle
  static const workspaceIcon = Icons.work;
  static const busIcon = Icons.directions_bus;
  static const metroIcon = Icons.train;
  static const tramIcon = Icons.tram;
  static const carpoolingIcon = Icons.hail;
  static const electricScooter = Icons.electric_scooter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
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
              width: 30.0,
              height: 30.0,
              point: paris,
              builder: (ctx) => Container(
                child: RawMaterialButton(
                  onPressed: () {},
                  elevation: 2.0,
                  fillColor: Colors.white,
                  child: Icon(
                    Icons.account_tree,
                    size: 15.0,
                  ),
                  // padding: EdgeInsets.all(5.0),
                  shape: CircleBorder(),
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
