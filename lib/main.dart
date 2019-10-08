import 'package:drivebuddy/screens/first_view.dart';
import 'package:drivebuddy/screens/quiz_menu_screen.dart';
import 'package:drivebuddy/screens/sign_up_view.dart';
import 'package:drivebuddy/screens/home_screen.dart';
import 'package:drivebuddy/screens/provider_widget.dart';
import 'package:drivebuddy/screens/auth_service.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Provider(
      auth: AuthService(),
      child: MaterialApp(
        title: "DriveBuddy",
//      home: HomeScreen(),
      home: HomeController(),
        routes: <String, WidgetBuilder>{
          '/signUp': (BuildContext context) => SignUpView(authFormType: AuthFormType.signUp),
          '/signIn': (BuildContext context) => SignUpView(authFormType: AuthFormType.signIn),
          '/home': (BuildContext context) => HomeController(),
          '/quizmenu': (BuildContext context) => DriveQuizMenu(),
        },
      ),
    );
  }
}

class HomeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of(context).auth;
    return StreamBuilder<String>(
      stream: auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool signedIn = snapshot.hasData;
          return signedIn ? HomeScreen() : FirstView();
        }
        return CircularProgressIndicator();
      },
    );
  }
}

