import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';



class DriveQuiz5{
  var images = [
    "police", "policecar", "carsmoke", "accident","police15",
  ];

  var questions = [
    "走行中、後ろからパトカーが追いかけてくる。どうやら自分らしい。",
    "パトカーに止められた。どうする？",
    "走行中、エンジンマークが点灯。どうやって走行する？",
    "相手の車とレンタカーで事故を起こした。どうする？",
    "制限速度より15マイルオーバーで警察に捕まった。どうなる？",

  ];

  var choices = [
    ["そのまま走行", "左に寄せて停車", "その場で停車", "右に寄せて停車"],
    ["自ら車外に出る", "車内で待つ", "逃げる", "手を上げて車内で待つ"],
    ["警察に電話", "そのまま走行", "ハザードを点灯", "助けを呼ぶ"],
    ["示談で終わらせる", "警察を呼ぶ", "レンタカー会社に電話", "逃げる"],
    ["署に拘束連行", "違反切符", "注意で終わる", "免許剥奪"],
  ];

  var correctAnswers = [
    "右に寄せて停車", "車内で待つ", "ハザードを点灯", "レンタカー会社に電話"," 違反切符",
  ];

}



var finalScore= 0;
var questionNumber = 0;
var quiz = new DriveQuiz5();


class Quiz5 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new Quiz5State();
  }

}

class Quiz5State extends State<Quiz5>{
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: ()async => false,
        child: Scaffold(
          appBar: new AppBar(
            title: new Text("Quiz 5 トラブル編＜初級＞"),
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

                      new Text("Question ${questionNumber + 1} of ${quiz.questions.length}",
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
                    onPressed: () {
                      Navigator.popUntil(context, ModalRoute.withName("/a"));
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