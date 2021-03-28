import 'package:flutter/material.dart';
import 'package:flutter_app/views/auth/login.dart';

import 'package:flutter_app/views/workspaces/index.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demos',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Login(),
        routes: <String, WidgetBuilder>{
          Login.route: (context) => Login(),
          Workspaces.route: (context) => Workspaces()
        }
        // home: MyHomePage(title: 'Flutter Demo Home Page'),
        );
  }
}
