import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';



class DriveQuiz3{
  var images = [
    "stealing", "panic", "beer", "parking", "key",
  ];

  var questions = [
    "右折のウインカーを点灯したい。バーと上下どっち？",
    "ハザードはなんの時に点灯すべき？",
    "お酒を車内から見える位置に置いてた警察に見つかるとどうなる？",
    "駐車場のラインが日本と違い斜めに引かれている。駐車の仕方は？",
    "広い駐車場に止めてどこに車があるかわからなくなった。どうする？",
  ];

  var choices = [
    ["左上", "右上", "左下", "右下"],
    ["道を譲る時", "徐行", "Thanks", "緊急事態"],
    ["何もない", "横取りされる", "違反切符", "注意される"],
    ["バックで駐車", "頭から駐車", "どちらでも", "縦列駐車"],
    ["自力で探す", "人に聞く", "鍵ボタンを二度押す", "助けを呼ぶ"],
  ];

  var correctAnswers = [
    "左上", "緊急事態", "違反切符", "頭から駐車", "鍵ボタンを二度押す",
  ];

}



var finalScore= 0;
var questionNumber = 0;
var quiz = new DriveQuiz3();


class Quiz3 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new Quiz3State();
  }

}

class Quiz3State extends State<Quiz3>{
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: ()async => false,
        child: Scaffold(
          appBar: new AppBar(
            title: new Text("Quiz 3 車輌編＜初級＞"),
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

                      AutoSizeText("Question ${questionNumber + 1} of ${quiz.questions.length}",
                        style: new TextStyle(
                            fontSize: 20.0
                        ),),

                      new Text("Score: $finalScore",
                        style: new TextStyle(
                            fontSize: 20.0
                        ),)
                    ],
                  ),
                ),

                //image
                new Padding(padding: EdgeInsets.all(5.0)),

                new Image.asset(
                    "images/${quiz.images[questionNumber]}.jpg"
                ),

                new Padding(padding: EdgeInsets.all(10.0)),

                new Text(quiz.questions[questionNumber],
                  style: new TextStyle(
                    fontSize: 20.0,
                  ),),

                new Padding(padding: EdgeInsets.all(10.0)),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    //button1
                    new MaterialButton(
                      minWidth: 120.0,
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),),
                      onPressed:(){

                        if(quiz.choices[questionNumber][0] == quiz.correctAnswers[questionNumber]){
                          debugPrint("Correct");
                          finalScore++;
                        }else{
                          debugPrint("wrong");
                        }
                        updateQuestion();
                      },
                      child: new Text(quiz.choices[questionNumber][0],
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white
                        ),),
                    ),

                    //button2
                    new MaterialButton(
                      minWidth: 120.0,
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),),
                      onPressed:(){

                        if(quiz.choices[questionNumber][1] == quiz.correctAnswers[questionNumber]){
                          debugPrint("Correct");
                          finalScore++;
                        }else{
                          debugPrint("wrong");
                        }
                        updateQuestion();
                      },
                      child: new Text(quiz.choices[questionNumber][1],
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white
                        ),),
                    ),

                  ],
                ),

                new Padding(padding: EdgeInsets.all(10.0)),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    //button3
                    new MaterialButton(
                      minWidth: 120.0,
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),),
                      onPressed:(){

                        if(quiz.choices[questionNumber][2] == quiz.correctAnswers[questionNumber]){
                          debugPrint("Correct");
                          finalScore++;
                        }else{
                          debugPrint("wrong");
                        }
                        updateQuestion();
                      },
                      child: new Text(quiz.choices[questionNumber][2],
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white
                        ),),
                    ),

                    //button4
                    new MaterialButton(
                      minWidth: 120.0,
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      onPressed:(){
                        if(quiz.choices[questionNumber][3] == quiz.correctAnswers[questionNumber]){
                          debugPrint("Correct");
                          finalScore++;
                        }else{
                          debugPrint("wrong");
                        }
                        updateQuestion();
                      },
                      child: new Text(quiz.choices[questionNumber][3],
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white
                        ),),
                    ),

                  ],
                ),

                new Padding(padding: EdgeInsets.all(10.0)),

                new Container(
                  alignment: Alignment.bottomCenter,
                  child: new MaterialButton(
                    color: Colors.indigo,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),),
                    minWidth: 240.0,
                    height: 40.0,
                    onPressed: resetQuiz,
                    child: new Text("一覧に戻る",
                      style: new TextStyle(
                          fontSize: 18.0,
                          color: Colors.white
                      ),),
                  ),
                )



              ],
            ),
          ),
        )
    );
  }


  void resetQuiz(){
    setState(() {
      Navigator.pop(context);
      finalScore = 0;
      questionNumber = 0;
    });
  }


  void updateQuestion(){
    setState(() {
      if (questionNumber == quiz.questions.length - 1){
        Navigator.push(context, new MaterialPageRoute(builder: (context)=>new Summary(score: finalScore)));
      }else{
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

          body: new Container(
            alignment: Alignment.center,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                new Text("Final Score: $score",
                  style: new TextStyle(
                      fontSize: 25.0
                  ),),

                new Padding(padding: EdgeInsets.all(10.0)),

                new MaterialButton(
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),),
                    onPressed: () {
                      questionNumber = 0;
                      finalScore = 0;
                      Navigator.pop(context);
                    },
                    child: new Text("もう一度受ける",
                      style: new TextStyle(
                          fontSize: 20.0,
                          color: Colors.white
                      ),)),

                new Padding(padding: EdgeInsets.all(10.0)),

                new MaterialButton(
                    color: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),),
                    onPressed: (){
                      questionNumber = 0;
                      finalScore = 0;
                      Navigator.of(context).pushNamed("/quizmenu");
                    },
                    child: new Text("一覧に戻る",
                      style: new TextStyle(
                          fontSize: 20.0,
                          color: Colors.white
                      ),))

              ], // Column
            ),
          )

      ),
    );
  }

}