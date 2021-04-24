import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/components/markers/transports/busMarkers.dart';
import 'package:flutter_app/components/workspaces/StarsBar.dart';
import 'package:flutter_app/data/api.dart';
import 'package:flutter_app/models/workspace.dart';
import 'package:flutter_app/views/workspaces/_workspaceId.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class WorkspaceMarker {
  final Workspace workspace;
  static final icon = Icons.work;
  static final color = Colors.brown;

  WorkspaceMarker({this.workspace});

  Widget transportDuration({IconData icon, String label}) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20.0,
          color: Colors.black.withOpacity(0.8),
        ),
        SizedBox(width: 7),
        Text(label)
      ],
    );
  }

  _showModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Card(
              child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WorkspacePage(
                            workspace: workspace,
                          )));
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: workspace.images
                        .map((image) => Container(
                              width: 300.0,
                              child: Image.network(
                                image,
                                fit: BoxFit.fill,
                              ),
                            ))
                        .toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(workspace.name,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500)),
                            StarsBar(),
                            Text(
                              workspace.adresse,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            transportDuration(
                                icon: Icons.pedal_bike,
                                label: "4.5 km - 22 min"),
                            transportDuration(
                                icon: Icons.directions_walk,
                                label: "4.2 km - 53 min"),
                            transportDuration(
                                icon: BusMarker.icon, label: "6.0 km - 42 min")
                          ],
                        )
                      ]),
                ),
                SizedBox(
                  height: 8,
                )
              ],
            ),
          ));
        });
  }

  Marker widget({BuildContext context, Function onClick}) {
    return Marker(
        width: 30.0,
        height: 30.0,
        point: LatLng(workspace.lat, workspace.lng),
        builder: (ctx) => Container(
                child: RawMaterialButton(
              onPressed: () {
                onClick(workspace);
                _showModalBottomSheet(context);
              },
              elevation: 2.0,
              fillColor: color,
              child: Icon(
                icon,
                size: 15.0,
              ),
              shape: CircleBorder(),
            )));
  }
}

class WorkspaceMarkers {
  WorkspaceMarkers();

  final List<Workspace> workspaces = API.workspaces;

  Iterable<Marker> widgets({BuildContext context, Function onClick}) {
    return workspaces.map((workspace) => WorkspaceMarker(workspace: workspace)
        .widget(context: context, onClick: onClick));
  }
}
