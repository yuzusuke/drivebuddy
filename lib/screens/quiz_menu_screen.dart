import 'package:flutter/material.dart';
import './quiz1_screen.dart';
import './quiz2_screen.dart';
import './quiz3_screen.dart';
import './quiz4_screen.dart';
import './quiz5_screen.dart';







class DriveQuizMenu extends StatefulWidget {
  @override
  DriveQuizMenuState createState() => DriveQuizMenuState();
  }


class DriveQuizMenuState extends State<DriveQuizMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drive Rule Quiz"),
        backgroundColor: Colors.indigoAccent,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            title: Text('Quiz'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Profile'),
          ),
        ],
      ),


      body: new Container(
        margin: const EdgeInsets.all(15.0),
        child: new Column(

          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            new RaisedButton(
              padding: EdgeInsets.all(20.0),
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
                side: BorderSide(color: Colors.indigo, width: 1.0),
              ),
              onPressed: () {
                this.startQuiz();
              },
              child: Text("Quiz 1 標識編＜初級＞",
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                ),),
            ),

            new Padding(padding: EdgeInsets.all(10.0)),

            new MaterialButton(
              padding: EdgeInsets.all(20.0),
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
                side: BorderSide(color: Colors.indigo, width: 1.0),
              ),
              onPressed: () {
                this.startQuiz2();
              },
              child: new Text("Quiz 2 走行編＜初級＞",
                style: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.black
                ),),
            ),

            new Padding(padding: EdgeInsets.all(10.0)),

            new MaterialButton(
              padding: EdgeInsets.all(20.0),
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
                side: BorderSide(color: Colors.indigo, width: 1.0),
              ),
              onPressed: () {
                this.startQuiz3();
              },
              child: new Text("Quiz 3 車輌編＜初級＞",
                style: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.black
                ),),
            ),

            new Padding(padding: EdgeInsets.all(10.0)),

            new MaterialButton(
              padding: EdgeInsets.all(20.0),
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
                side: BorderSide(color: Colors.indigo, width: 1.0),
              ),
              onPressed: () {
                this.startQuiz4();
              },
              child: new Text("Quiz 4 FreeWay編＜初級＞",
                style: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.black
                ),),
            ),

            new Padding(padding: EdgeInsets.all(10.0)),


            new MaterialButton(
              padding: EdgeInsets.all(20.0),
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
                side: BorderSide(color: Colors.indigo, width: 1.0),
              ),
              onPressed: () {
                this.startQuiz5();
              },
              child: new Text("Quiz 5 トラブル編＜初級＞",
                style: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.black
                ),),
            ),

            new Padding(padding: EdgeInsets.all(10.0)),


          ],
        ),
      ),


    );
  }

  void startQuiz() {
    setState(() {
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => new Quiz1()));
    });
  }

  void startQuiz2() {
    setState(() {
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => new Quiz2()));
    });
  }

  void startQuiz3() {
    setState(() {
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => new Quiz3()));
    });
  }

  void startQuiz4() {
    setState(() {
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => new Quiz4()));
    });
  }

  void startQuiz5() {
    setState(() {
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => new Quiz5()));
    });
  }

}