import 'package:flutter/material.dart';
import 'package:flutter_app/layout.dart';
import 'package:flutter_app/views/auth/login.dart';
import 'package:flutter_app/views/bookings.dart';
import 'package:flutter_app/views/profile.dart';

import 'package:flutter_app/views/workspaces/index.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Greemote',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(),
      routes: <String, WidgetBuilder>{
        "user": (context) => Layout(),
        // Login.route: (context) => Login(),
        // Workspaces.route: (context) => Workspaces(),
        // Bookings.route: (context) => Bookings(),
        // Profile.route: (context) => Profile()
      },
    );
  }
}
