import 'package:flutter/material.dart';
import 'package:drivebuddy/screens/home_screen.dart';
import 'package:drivebuddy/screens/first_vew.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DriveBuddy",
//      home: HomeScreen(),
    home: FirstView(),
      routes: <String, WidgetBuilder>{
        '/signUp': (BuildContext context) => HomeScreen(),
        '/home': (BuildContext context) => HomeScreen(),
      },
    );
  }
}

