import 'package:flutter/material.dart';
import 'package:flutter_app/components/markers/transports/busMarkers.dart';
import 'package:flutter_app/components/markers/transports/carpoolingMarkers.dart';
import 'package:flutter_app/components/markers/transports/scooterMarkers.dart';
import 'package:flutter_app/components/markers/transports/tramMarkers.dart';
import 'package:flutter_app/components/workspaces/BarChartPricing.dart';
import 'package:flutter_app/components/workspaces/StarsBar.dart';
import 'package:flutter_app/models/workspace.dart';

class WorkspacePage extends StatelessWidget {
  final Workspace workspace;
  const WorkspacePage({Key key, this.workspace}) : super(key: key);

  Widget listItem({IconData icon, String label}) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20.0,
          color: Colors.black.withOpacity(0.8),
        ),
        SizedBox(width: 7),
        Text(
          label,
          style: TextStyle(color: Colors.black.withOpacity(0.8)),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(workspace.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 160.0,
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
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    workspace.name,
                    style: TextStyle(fontSize: 24),
                  ),
                  StarsBar(),
                  Text(workspace.adresse),
                  // Pricing
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    child: BarChartPricing.withSampleData(),
                  ),
                  // Transportations
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Transportation",
                    style: TextStyle(fontSize: 22),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            listItem(
                                icon: Icons.pedal_bike,
                                label: "4.5 km - 22 min"),
                            listItem(
                                icon: Icons.directions_walk,
                                label: "4.2 km - 53 min"),
                            listItem(
                                icon: BusMarker.icon, label: "6.0 km - 42 min")
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            listItem(
                                icon: TramMarker.icon,
                                label: "4.5 km - 22 min"),
                            listItem(
                                icon: CarpoolingMarker.icon,
                                label: "4.2 km - 53 min"),
                            listItem(
                                icon: ScooterMarker.icon,
                                label: "6.0 km - 42 min")
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Advantage",
                    style: TextStyle(fontSize: 22),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            listItem(icon: Icons.wifi, label: "Free wifi"),
                            listItem(icon: Icons.car_rental, label: "Parking"),
                            listItem(icon: Icons.video_call, label: "Call box"),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            listItem(
                                icon: Icons.electric_bike,
                                label: "Bike charging station"),
                            listItem(
                                icon: Icons.local_drink,
                                label: "Drink dispenser"),
                            listItem(
                                icon: Icons.smoke_free, label: "Smoking area"),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
