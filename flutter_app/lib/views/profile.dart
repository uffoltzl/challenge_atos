import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key key}) : super(key: key);

  static const String route = 'profile';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Profile view"),
    );
  }
}
