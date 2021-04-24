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

  Widget listItem(
      {IconData icon,
      String label,
      MaterialColor color = Colors.grey,
      double fontSize = 14}) {
    return Row(
      children: [
        Icon(
          icon,
          size: 30.0,
          color: color[900].withOpacity(0.8),
        ),
        SizedBox(width: 7),
        Text(
          label,
          style:
              TextStyle(color: color[900].withOpacity(0.8), fontSize: fontSize),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Book a place'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  BarChartPricing.withSampleData(),
                ],
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                  child: Text('Book'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ],
          );
        },
      );
    }

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
                  SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: new ElevatedButton(
                        onPressed: _showMyDialog, child: Text('Book my place')),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Transportation",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(width: 2.0, color: Colors.green[800])),
                    child: Padding(
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
                                  icon: BusMarker.icon,
                                  label: "6.0 km - 42 min")
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
                            listItem(
                              icon: Icons.wifi,
                              label: "Free wifi",
                            ),
                            listItem(
                              icon: Icons.car_rental,
                              label: "Parking",
                            ),
                            listItem(
                              icon: Icons.video_call,
                              label: "Call box",
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            listItem(
                              icon: Icons.electric_bike,
                              label: "Bike charging station",
                            ),
                            listItem(
                              icon: Icons.local_drink,
                              label: "Drink dispenser",
                            ),
                            listItem(
                              icon: Icons.smoking_rooms_rounded,
                              label: "Smoking area",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "About",
                    style: TextStyle(fontSize: 22),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 1.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam dictum sed sapien in laoreet. Phasellus ut ligula id leo rutrum pretium. Fusce at tincidunt orci. Nulla congue lacinia tellus in dapibus. Pellentesque congue feugiat erat quis varius. Aliquam neque magna, posuere sit amet molestie ut, tempus et turpis. Vivamus sed purus dui."),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam dictum sed sapien in laoreet. Phasellus ut ligula id leo rutrum pretium. Fusce at tincidunt orci. Nulla congue lacinia tellus in dapibus. Pellentesque congue feugiat erat quis varius. Aliquam neque magna, posuere sit amet molestie ut, tempus et turpis. Vivamus sed purus dui."),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam dictum sed sapien in laoreet. Phasellus ut ligula id leo rutrum pretium. Fusce at tincidunt orci. Nulla congue lacinia tellus in dapibus. Pellentesque congue feugiat erat quis varius. Aliquam neque magna, posuere sit amet molestie ut, tempus et turpis. Vivamus sed purus dui."),
                          ),
                        ],
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
