import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:drivebuddy/screens/custom_dialog.dart';


class FirstView extends StatelessWidget {
  final primaryColor = const Color(0xFF75A2EA);


  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: _width,
        height: _height,
        color: primaryColor,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: _height * 0.10,
                ),
                Text(
                  "DriveBuddy",
                  style: TextStyle(
                      fontSize: 44,
                      color: Colors.white
                  ),
                ),
                SizedBox(
                  height: _height * 0.10,
                ),
                AutoSizeText(
                  "I can help your Drive in US. Let's learn it!!",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.white
                  ),
                ),
                SizedBox(
                  height: _height * 0.15,
                ),
                RaisedButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                  child: Padding(
                    padding: const EdgeInsets.only(top:10.0, bottom: 10.0, left: 30.0, right: 30.0),
                    child: Text("アカウント登録", style: TextStyle(color: primaryColor, fontSize: 28, fontWeight: FontWeight.w300),),
                  ),
                  onPressed: (){
                    showDialog(
                        context: context,
                      builder: (BuildContext context) => CustomDialog(
                        title: "アカウントを作りますか？",
                        description: "アカウントを登録すると簡単にログイン出来てデータを保存できます。",
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
                  onPressed: (){},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
