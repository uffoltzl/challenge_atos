import 'package:flutter/material.dart';
import 'package:flutter_app/components/markers/transports/busMarkers.dart';
import 'package:flutter_app/components/markers/transports/carpoolingMarkers.dart';
import 'package:flutter_app/components/markers/transports/scooterMarkers.dart';
import 'package:flutter_app/components/markers/transports/tramMarkers.dart';
import 'package:flutter_app/components/markers/userMarker.dart';
import 'package:flutter_app/components/markers/workspaceMarkers.dart';
import 'package:flutter_app/components/workspaces/searchModel.dart';

import 'package:flutter_app/data/api.dart';
import 'package:flutter_app/models/workspace.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:latlong/latlong.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:provider/provider.dart';

class WorkspacesPage extends StatefulWidget {
  const WorkspacesPage({Key key}) : super(key: key);
  static const String route = 'workspaces';

  @override
  _WorkspacesPageState createState() => _WorkspacesPageState();
}

class _WorkspacesPageState extends State<WorkspacesPage>
    with TickerProviderStateMixin {
  final controller = FloatingSearchBarController();
  LatLng center = API.currentUserLocation;

  MapController mapController;
  double rotation = 0.0;
  @override
  void initState() {
    super.initState();
    mapController = MapController();
  }

  void _animatedMapMove(LatLng destLocation, double destZoom) {
    final _latTween = Tween<double>(
        begin: mapController.center.latitude, end: destLocation.latitude);
    final _lngTween = Tween<double>(
        begin: mapController.center.longitude, end: destLocation.longitude);
    final _zoomTween = Tween<double>(begin: mapController.zoom, end: destZoom);

    var controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);

    Animation<double> animation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    controller.addListener(() {
      mapController.move(
          LatLng(_latTween.evaluate(animation), _lngTween.evaluate(animation)),
          _zoomTween.evaluate(animation));
    });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.dispose();
      } else if (status == AnimationStatus.dismissed) {
        controller.dispose();
      }
    });

    controller.forward();
  }

  void _handleWorkspaceClick(Workspace workspace) {
    setState(() {
      center = new LatLng(workspace.lat, workspace.lng);
    });
    _animatedMapMove(center, 14.0);
  }

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

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SearchModel(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: buildSpeedDial(),
        body: buildSearchBar(context),
      ),
    );
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

  Widget buildSearchBar(BuildContext context) {
    return Consumer<SearchModel>(
      builder: (context, model, _) => FloatingSearchBar(
        key: Key("floating-search-bar"),
        hint: 'Search...',
        progress: model.isLoading,
        automaticallyImplyBackButton: false,
        controller: controller,
        onQueryChanged: model.onQueryChanged,
        clearQueryOnClose: true,
        transitionCurve: Curves.easeInOutCubic,
        transition: CircularFloatingSearchBarTransition(),
        physics: const BouncingScrollPhysics(),
        builder: (context, _) => buildSearchResult(context),
        body: buildPage(context),
      ),
    );
  }

  Widget buildSearchResult(BuildContext context) {
    final model = Provider.of<SearchModel>(context, listen: false);
    return Consumer<SearchModel>(
        builder: (context, model, _) => ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Material(
                  child: Column(children: [
                model.suggestions.length > 0
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: model.suggestions.length,
                        itemBuilder: (context, index) {
                          Workspace workspace =
                              model.suggestions.elementAt(index);
                          return ListTile(
                              onTap: () {
                                _handleWorkspaceClick(workspace);
                                FloatingSearchBar.of(context).close();
                              },
                              title: Text('${workspace.name}'),
                              subtitle: Text('${workspace.adresse}'));
                        })
                    : ListTile(
                        title: Text('No result found'),
                      )
              ])),
            ));
  }

  Widget buildPage(BuildContext context) {
    List<Marker> markers = [
      UserMarker().widget(context),
      ...WorkspaceMarkers()
          .widgets(context: context, onClick: _handleWorkspaceClick)
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

    return FlutterMap(
      key: Key("flutter-map"),
      mapController: mapController,
      options: MapOptions(
        center: center,
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
    );
  }
}
