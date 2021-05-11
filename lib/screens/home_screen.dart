import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          // alt + enter を押してWrap with Centerを選択
          child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Image.asset("assets/images/image_title.png"),
                Text("問題数を選択して「スタート」ボタンを押してください"),
                //TODO ブルダウン選択肢
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.only(bottom: 12.0),
                    child: Expanded(
                      //
                      child: ElevatedButton.icon(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.brown),
                        ),
                        onPressed: () => print("ボタンのしたで～"), //TODO
                        label: Text("スタート"),
                        icon: Icon(Icons.skip_next),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
