import 'package:flutter/material.dart';
import 'package:flutter_app/components/markers/transports/busMarkers.dart';
import 'package:flutter_app/components/markers/transports/carpoolingMarkers.dart';
import 'package:flutter_app/components/markers/transports/scooterMarkers.dart';
import 'package:flutter_app/components/markers/transports/tramMarkers.dart';
import 'package:flutter_app/components/markers/userMarker.dart';
import 'package:flutter_app/components/markers/workspaceMarkers.dart';
import 'package:flutter_app/data/api.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Workspaces extends StatefulWidget {
  const Workspaces({Key key}) : super(key: key);
  static const String route = 'workspaces';

  @override
  _WorkspacesState createState() => _WorkspacesState();
}

class _WorkspacesState extends State<Workspaces> {
// class Workspaces extends StatelessWidget {
  // const Workspaces({Key key}) : super(key: key);
  //
  bool busVisible = false;
  void handleBusVisibleChange() {
    setState(() {
      busVisible = !busVisible;
    });
  }

  bool tramVisible = false;
  void handleTramVisibleChange() {
    setState(() {
      tramVisible = !tramVisible;
    });
  }

  bool carpoolingVisible = false;
  void handleCarpoolingVisibleChange() {
    setState(() {
      carpoolingVisible = !carpoolingVisible;
    });
  }

  bool scooterVisible = false;
  void handleScooterVisibleChange() {
    setState(() {
      scooterVisible = !scooterVisible;
    });
  }

  bool dialVisible = true;
  void setDialVisible(bool value) {
    setState(() {
      dialVisible = value;
    });
  }

  SpeedDial buildSpeedDial() {
    return SpeedDial(
      marginEnd: 18,
      marginBottom: 20,
      icon: Icons.add,
      activeIcon: Icons.remove,
      buttonSize: 56.0,
      visible: true,
      closeManually: true,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      heroTag: 'speed-dial-hero-tag',
      backgroundColor: Colors.brown,
      foregroundColor: Colors.white,
      elevation: 8.0,
      shape: CircleBorder(),
      children: [
        SpeedDialChild(
          child: Icon(BusMarker.icon),
          backgroundColor: BusMarker.color,
          onTap: handleBusVisibleChange,
        ),
        SpeedDialChild(
          child: Icon(TramMarker.icon),
          backgroundColor: TramMarker.color,
          onTap: handleTramVisibleChange,
        ),
        SpeedDialChild(
          child: Icon(CarpoolingMarker.icon),
          backgroundColor: CarpoolingMarker.color,
          onTap: handleCarpoolingVisibleChange,
        ),
        SpeedDialChild(
          child: Icon(ScooterMarker.icon),
          backgroundColor: ScooterMarker.color,
          onTap: handleScooterVisibleChange,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Marker> markers = [
      UserMarker().widget(context),
      ...WorkspaceMarkers().widgets(context)
    ];
    if (busVisible) {
      markers.addAll(BusMarkers().widgets(context));
    }
    if (carpoolingVisible) {
      markers.addAll(CarpoolingMarkers().widgets(context));
    }
    if (scooterVisible) {
      markers.addAll(ScooterMarkers().widgets(context));
    }
    if (tramVisible) {
      markers.addAll(TramMarkers().widgets(context));
    }

    return Scaffold(
      floatingActionButton: buildSpeedDial(),
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
