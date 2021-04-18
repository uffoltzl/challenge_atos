import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/animations/FadeAnimation.dart';
import 'package:flutter_app/data/workspaces.dart';
import 'package:flutter_app/models/workspace.dart';

final random = Random();

class Bookings extends StatelessWidget {
  const Bookings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Color.fromRGBO(246, 248, 253, 1)
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "My bookings",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            ...List<Widget>.generate(
              30,
              (index) {
                if (index.isEven) {
                  return SizedBox(
                    height: 20,
                  );
                }

                Workspace workspace =
                    Workspaces.elementAt(random.nextInt(Workspaces.length - 1));
                return FadeAnimation(1 + index / 10,
                    makeItem(date: index.toString(), workspace: workspace));
              },
            )
          ]),
        ),
      ),
    );
  }

  Widget makeItem({String date, Workspace workspace}) {
    return Row(
      children: <Widget>[
        Container(
          width: 50,
          height: 125,
          margin: EdgeInsets.only(right: 20),
          child: Column(
            children: <Widget>[
              Text(
                date.toString(),
                style: TextStyle(
                    color: Colors.brown,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "SEP",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            height: 125,
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(colors: [
                    Colors.brown.withOpacity(.9),
                    Colors.brown.withOpacity(.8),
                  ])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    workspace.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    workspace.adresse,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.access_time,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "9:00 - 12:00 / 14:00 - 18:00",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
