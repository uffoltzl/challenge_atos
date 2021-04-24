import 'package:flutter/material.dart';
import 'package:flutter_app/views/bookings.dart';

import 'package:flutter_app/views/profile.dart';
import 'package:flutter_app/views/workspaces/index.dart';

/// This is the stateful widget that the main application instantiates.
class Layout extends StatefulWidget {
  const Layout({Key key}) : super(key: key);

  @override
  _LayoutState createState() => _LayoutState();
}

/// This is the private State class that goes with Layout.
class _LayoutState extends State<Layout> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    WorkspacesPage(),
    BookingsPage(),
    ProfilePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Workspaces',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'My bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.brown[400],
        onTap: _onItemTapped,
      ),
    );
  }
}
