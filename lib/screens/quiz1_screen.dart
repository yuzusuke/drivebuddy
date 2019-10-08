import 'package:flutter/material.dart';
import 'quiz_menu_screen.dart';
import 'package:auto_size_text/auto_size_text.dart';

class DriveQuiz {
  var images = [
    "stop",
    "oneway",
    "donotenter",
    "speedlimit",
    "yield",
  ];

  var questions = ["この標識は何？", "この標識は何？", "この標識は何？", "この道の制限速度は？","この標識は何？"];

  var choices = [
    ["一時停止", "一方通行", "進入禁止", "徐行運転"],
    ["前方注意", "一時停止", "ライト点灯", "一方通行"],
    ["一時停止", "一方通行", "進入禁止", "速度制限"],
    ["25マイル","20マイル", "30マイル", "15マイル"],
    ["走行注意", "先に譲れ", "徐行走行", "目前注意"],

  ];

  var correctAnswers = ["一時停止", "一方通行", "進入禁止", "25マイル","先に譲れ"];
}

var finalScore = 0;
var questionNumber = 0;
var quiz = new DriveQuiz();

class Quiz1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new Quiz1State();
  }
}

class Quiz1State extends State<Quiz1> {
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: new AppBar(
            title: new Text("Quiz 1 標識編＜初級＞"),
            backgroundColor: Colors.indigoAccent,
          ),

          body: new Container(
            margin: const EdgeInsets.all(10.0),
            alignment: Alignment.topCenter,
            child: new Column(
              children: <Widget>[
                new Padding(padding: EdgeInsets.all(5.0)),

                new Container(
                  alignment: Alignment.centerRight,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      AutoSizeText(
                        "Question ${questionNumber + 1} of ${quiz.questions.length}",
                        style: new TextStyle(fontSize: 20.0),
                      ),
                      new Text(
                        "Score: $finalScore",
                        style: new TextStyle(fontSize: 20.0),
                      )
                    ],
                  ),
                ),

                //image
                new Padding(padding: EdgeInsets.all(5.0)),

                new Image.asset("images/${quiz.images[questionNumber]}.jpg"),

                new Padding(padding: EdgeInsets.all(10.0)),

                AutoSizeText(
                  quiz.questions[questionNumber],
                  style: new TextStyle(
                    fontSize: 20.0,
                  ),
                ),

                new Padding(padding: EdgeInsets.all(10.0)),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //button1
                    new MaterialButton(
                      minWidth: 120.0,
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      onPressed: () {
                        if (quiz.choices[questionNumber][0] ==
                            quiz.correctAnswers[questionNumber]) {
                          debugPrint("Correct");
                          finalScore++;
                        } else {
                          debugPrint("wrong");
                        }
                        updateQuestion();
                      },
                      child: new Text(
                        quiz.choices[questionNumber][0],
                        style:
                        new TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),

                    //button2
                    new MaterialButton(
                      minWidth: 120.0,
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      onPressed: () {
                        if (quiz.choices[questionNumber][1] ==
                            quiz.correctAnswers[questionNumber]) {
                          debugPrint("Correct");
                          finalScore++;
                        } else {
                          debugPrint("wrong");
                        }
                        updateQuestion();
                      },
                      child: new Text(
                        quiz.choices[questionNumber][1],
                        style:
                        new TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                  ],
                ),

                new Padding(padding: EdgeInsets.all(5.0)),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //button3
                    new MaterialButton(
                      minWidth: 120.0,
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      onPressed: () {
                        if (quiz.choices[questionNumber][2] ==
                            quiz.correctAnswers[questionNumber]) {
                          debugPrint("Correct");
                          finalScore++;
                        } else {
                          debugPrint("wrong");
                        }
                        updateQuestion();
                      },
                      child: new Text(
                        quiz.choices[questionNumber][2],
                        style:
                        new TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),

                    //button4
                    new MaterialButton(
                      minWidth: 120.0,
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      onPressed: () {
                        if (quiz.choices[questionNumber][3] ==
                            quiz.correctAnswers[questionNumber]) {
                          debugPrint("Correct");
                          finalScore++;
                        } else {
                          debugPrint("wrong");
                        }
                        updateQuestion();
                      },
                      child: new Text(
                        quiz.choices[questionNumber][3],
                        style:
                        new TextStyle(fontSize: 20.0, color: Colors.white),
                      ),

                    ),
                  ],
                ),

                new Padding(padding: EdgeInsets.all(5.0)),

                new Container(
                  alignment: Alignment.bottomCenter,
                  child: new MaterialButton(
                    color: Colors.indigo,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    minWidth: 240.0,
                    height: 40.0,
                    onPressed: resetQuiz,
                    child: new Text(
                      "一覧に戻る",
                      style: new TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void resetQuiz() {
    setState(() {
      Navigator.pop(context);
      finalScore = 0;
      questionNumber = 0;
    });
  }

  void updateQuestion() {
    setState(() {
      if (questionNumber == quiz.questions.length - 1) {
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => new Summary(score: finalScore)));
      } else {
        questionNumber++;
      }
    });
  }
}

class Summary extends StatelessWidget {
  final int score;
  Summary({Key key, @required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          appBar: new AppBar(
            title: new Text("Quiz 1 標識編＜初級＞"),
            backgroundColor: Colors.indigoAccent,
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

          body: new Container(
            alignment: Alignment.center,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "Final Score: $score",
                  style: new TextStyle(fontSize: 25.0),
                ),
                new Padding(padding: EdgeInsets.all(10.0)),
                new MaterialButton(
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    onPressed: () {
                      questionNumber = 0;
                      finalScore = 0;
                      Navigator.pop(context);
                    },
                    child: new Text(
                      "もう一度受ける",
                      style: new TextStyle(fontSize: 20.0, color: Colors.white),
                    )),
                new Padding(padding: EdgeInsets.all(10.0)),
                new MaterialButton(
                    color: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    onPressed: () => quizMenu(context),
                    child: new Text(
                      "一覧に戻る",
                      style: new TextStyle(fontSize: 20.0, color: Colors.white),
                    ))
              ], // Column
            ),
          )),
    );
  }
}

quizMenu(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => DriveQuizMenu()));
}

