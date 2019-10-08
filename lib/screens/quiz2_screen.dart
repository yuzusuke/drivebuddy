import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';


class DriveQuiz2{
  var images = [
    "us-road", "redsignal", "911", "homeless","thanks",
  ];

  var questions = [
    "アメリカの道路はどちら側を走行する？",
    "右折したいが赤信号だ",
    "後ろから緊急車両が来た",
    "停止中に横に物乞いしている人がこちらを見ている。",
    "走行中、道を譲ってくれたからお礼のハザードは？",
  ];

  var choices = [
    ["右", "左", "真ん中", "どちらでも"],
    ["一時停止して右折", "青まで待つ", "そのまま右折", "徐行しながら右折"],
    ["左に寄る", "右に寄る", "その場で停止", "そのまま走行"],
    ["窓を開けて何かあげる", "挨拶する", "目を合わせない", "警察を呼ぶ"],
    ["どちらでもいい", "それはダメ", "もちろん点灯", "３回点灯"],
  ];

  var correctAnswers = [
    "右", "一時停止して右折", "右に寄る", "目を合わせない", "それはダメ",
  ];

}



var finalScore= 0;
var questionNumber = 0;
var quiz = new DriveQuiz2();


class Quiz2 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new Quiz2State();
  }

}

class Quiz2State extends State<Quiz2>{
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: ()async => false,
        child: Scaffold(
          appBar: new AppBar(
            title: new Text("Quiz 2 走行編＜初級＞"),
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

                AutoSizeText(quiz.questions[questionNumber],
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

class Summary extends StatelessWidget{
  final int score;
  Summary({Key key, @required this.score}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: ()async => false,
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
                    onPressed: (){
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

              ],// Column
            ),
          )

      ),
    );
  }

}