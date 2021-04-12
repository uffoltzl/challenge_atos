import 'package:flutter/material.dart';
import 'package:flutter_app/data/api.dart';
import 'package:flutter_app/models/workspace.dart';
import 'package:flutter_app/views/workspaces/_workspaceId.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class WorkspaceMarker {
  final Workspace workspace;
  static final icon = Icons.work;
  static final color = Colors.brown[300];

  WorkspaceMarker({this.workspace});

  _showModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Card(
              clipBehavior: Clip.antiAlias,
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
                  children: [
                    Image(
                      // image: NetworkImage(
                      //     'https://images.pexels.com/photos/2451616/pexels-photo-2451616.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260'),
                      image: AssetImage(
                          'images/office/${workspace.images.elementAt(0)}'),
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes
                                : null,
                          ),
                        );
                      },
                    ),
                    // Image.asset('images/office/${workspace.images.elementAt(0)}'),
                    ListTile(
                      title: Text(workspace.name),
                      subtitle: Text(
                        workspace.adresse,
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
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
