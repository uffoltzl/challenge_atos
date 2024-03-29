import 'package:flutter/material.dart';
import 'package:flutter_app/animations/FadeAnimation.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _emailNotification = true;
  bool _pushNotification = true;

  void handleEmailNotificationChange(value) {
    setState(() {
      _emailNotification = value;
    });
  }

  void handlePushNotificationChange(value) {
    setState(() {
      _pushNotification = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _itemHeader = TextStyle(
      color: Colors.grey.shade600,
      fontSize: 16.0,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "My profile",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
          FadeAnimation(
              0.5,
              ListTile(
                key: Key("email"),
                title: Text(
                  "atos.it@challenge.com",
                ),
                leading: Icon(Icons.mail),
              )),
          _buildDivider(),
          FadeAnimation(
            0.5 + 0.1,
            ListTile(
              title: Text(
                "notifications",
                style: _itemHeader,
              ),
              leading: Icon(Icons.notifications),
            ),
          ),
          FadeAnimation(
            0.5 + 0.2,
            SwitchListTile(
              value: _emailNotification,
              title: Text("email notifications"),
              onChanged: handleEmailNotificationChange,
              secondary: SizedBox(
                width: 10,
              ),
            ),
          ),
          FadeAnimation(
            0.5 + 0.3,
            SwitchListTile(
              value: _pushNotification,
              title: Text("push notifications"),
              onChanged: handlePushNotificationChange,
              secondary: SizedBox(
                width: 10,
              ),
            ),
          ),
          _buildDivider(),
          FadeAnimation(
            0.5 + 0.4,
            ListTile(
              title: Text("feedback"),
              subtitle: Text("we would love to hear your experience"),
              leading: Icon(Icons.feedback),
            ),
          ),
          FadeAnimation(
            0.5 + 0.5,
            ListTile(
              title: Text("terms and conditions"),
              subtitle: Text("legal, terms and conditions"),
              leading: Icon(Icons.usb_rounded),
            ),
          ),
          FadeAnimation(
            0.5 + 0.6,
            ListTile(
              title: Text("logout"),
              subtitle: Text("you can logout from here"),
              leading: Icon(Icons.exit_to_app),
              onTap: () => {
                Navigator.pushNamedAndRemoveUntil(
                    context, "/", ModalRoute.withName("/"))
              },
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildDivider() {
    return Padding(
      padding: const EdgeInsets.only(left: 70),
      child: Divider(
        color: Colors.black,
      ),
    );
  }
}
