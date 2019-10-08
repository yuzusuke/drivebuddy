import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:drivebuddy/screens/custom_dialog.dart';


class FirstView extends StatelessWidget {
  final primaryColor = const Color(0xFF42A5F5);


  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
//        decoration: BoxDecoration(
//          image: DecorationImage(
//            image: AssetImage("images/mainroad.jpg"),
//            fit: BoxFit.cover,
//          )
//        ),
        width: _width,
        height: _height,
        color: primaryColor,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: _height * 0.10,
                ),
                Text(
                  "DriveBuddy",
                  style: TextStyle(
                      fontSize: 55,
                      color: Colors.white
                  ),
                ),
                SizedBox(
                  height: _height * 0.10,
                ),
//                AutoSizeText(
//                  "I can help your Drive in US. Let's learn it!!",
//                  maxLines: 2,
//                  textAlign: TextAlign.center,
//                  style: TextStyle(
//                      fontSize: 35,
//                      color: Colors.white
//                  ),
//                ),
                SizedBox(
                  height: _height * 0.40,
                ),
                RaisedButton(
                  color: Colors.green,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                  child: Padding(
                    padding: const EdgeInsets.only(top:10.0, bottom: 10.0, left: 20.0, right: 20.0),
                    child: Text("アカウント登録", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w400),),
                  ),
                  onPressed: (){
                    showDialog(
                        context: context,
                      builder: (BuildContext context) => CustomDialog(
                        title: "アカウントを登録しますか？",
                        description: "簡単にログイン出来て今後データを保存できるようになります。",
                        primaryButtonText: "アカウント登録",
                        primaryButtonRoute: "/signUp",
                        secondaryButtonText: "あとで登録",
                        secondaryButtonRoute: "/home",
                      ),
                    );
                  },
                ),
            SizedBox(
              height: _height * 0.05),
                FlatButton(
                  child: Text("サインイン", style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  onPressed: (){
                    Navigator.of(context).pushReplacementNamed('/signIn');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
