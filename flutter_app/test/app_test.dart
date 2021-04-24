import 'package:flutter_app/app.dart';
import 'package:flutter_app/data/workspaces.dart';
import 'package:flutter_app/views/bookings.dart';
import 'package:flutter_app/views/workspaces/index.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/auth/login.dart';
import 'package:flutter_app/views/profile.dart';

void main() {
  testWidgets('Login page', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Login(),
      ),
    ));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    // Check login form
    // Email input
    expect(find.byKey(Key("email-input")), findsOneWidget);
    // Password input
    expect(find.byKey(Key("password-input")), findsOneWidget);
    // Find login button
    expect(find.byKey(Key("login-button")), findsOneWidget);
  });

  testWidgets('Workspaces page', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: WorkspacesPage(),
      ),
    ));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    // Check if the float seach bar exists
    expect(find.byKey(Key("floating-search-bar")), findsOneWidget);
    // Check if the flutter map bar exists
    expect(find.byKey(Key("flutter-map")), findsOneWidget);
  });

  testWidgets('Bookings page', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: BookingsPage(),
      ),
    ));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    expect(find.text("My bookings"), findsOneWidget);
  });
}
