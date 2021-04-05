import 'package:flutter/material.dart';
import 'package:flutter_app/layout.dart';
import 'package:flutter_app/views/auth/login.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Greemote',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: Login(),
      routes: <String, WidgetBuilder>{
        "user": (context) => Layout(),
      },
    );
  }
}
