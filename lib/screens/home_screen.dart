import 'package:flutter/material.dart';
import 'package:drivebuddy/screens/first_vew.dart';
import 'quiz_menu_screen.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> _texts = [
    "Profile",
    "Rule",
    "Quiz",
    "How To",
    "Rental",
    "Emergency"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text("DriveBuddy"),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.library_books),
            title: new Text('Quiz'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.settings),
            title: new Text('Profile'),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        color: Colors.white70,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: _homeButton(_texts[0],
                      )),
                  Expanded(flex: 1, child: _homeButton(_texts[1])),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(flex: 1, child: _homeButton(_texts[2])),
                  Expanded(flex: 1, child: _homeButton(_texts[3])),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(flex: 1, child: _homeButton(_texts[4])),
                  Expanded(flex: 1, child: _homeButton(_texts[5])),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _homeButton(String displayText) {
    return Container(
      padding: EdgeInsets.all(13.0),
      child: RaisedButton(
        color: Colors.white70,
        onPressed: () => quizMenu(context),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          side: BorderSide(color: Colors.indigo, width: 2.0),
        ),
        child: Text(displayText,
            style: TextStyle(color: Colors.black, fontSize: (20.0))),
      ),
    );
  }

  quizMenu(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DriveQuizMenu()));
  }
}