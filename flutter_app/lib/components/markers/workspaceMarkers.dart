import 'package:flutter/material.dart';
import 'package:flutter_app/data/api.dart';
import 'package:flutter_app/models/workspace.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class WorkspaceMarker {
  final Workspace workspace;
  static final icon = Icons.work;
  static final color = Colors.brown[300];

  WorkspaceMarker({this.workspace});

  Marker widget({BuildContext context, Function onClick}) {
    return Marker(
        width: 30.0,
        height: 30.0,
        point: LatLng(workspace.lat, workspace.lng),
        builder: (ctx) => Container(
                child: RawMaterialButton(
              onPressed: () => onClick(workspace),
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
