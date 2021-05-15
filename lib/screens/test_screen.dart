// dart:htmlをコメントアウトしたらエラーが解決。理由は不明。
//import 'dart:html';

import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  final numberOFQuestions;

  TestScreen(this.numberOFQuestions);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int numberOfRemaining = 0;
  int numberOfCorrect = 0;
  int correctRate = 0;

  int questionLeft = 0;
  int questionRight = 0;
  String operator = "+";
  String answerString = "5";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: <Widget>[
                //スコア表示部分
                _scorePart(),
                //問題表示部分
                _questionPart(),
                //電卓ボタン部分
                _calcButtons(),
                //答え合わせボタン
                _answerCheckButton(),
                //戻るボタン
                _backButton()
              ],
            ),
            _correctIncorrectImage(),
            _endMessage(),
          ],
        ),
        //
      ),
    );
  }

//TODO スコア表示部分
  Widget _scorePart() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
      child: Table(
        children: [
          TableRow(
            children: [
              Center(
                  child: Text(
                    "のこり問題数",
                    style: TextStyle(fontSize: 10.0),
                  )),
              Center(
                  child: Text(
                    "正解数",
                    style: TextStyle(fontSize: 10.0),
                  )),
              Center(
                  child: Text(
                    "正答率",
                    style: TextStyle(fontSize: 10.0),
                  )),
            ],
          ),
          TableRow(children: [
            Center(
                child: Text(
                  numberOfRemaining.toString(),
                  style: TextStyle(fontSize: 18.0),
                )),
            Center(
                child: Text(
                  numberOfCorrect.toString(),
                  style: TextStyle(fontSize: 18.0),
                )),
            Center(
                child: Text(
                  correctRate.toString(),
                  style: TextStyle(fontSize: 18.0),
                )),
          ]),
        ],
      ),
    );
  }

//TODO 問題表示部分
  Widget _questionPart() {
    return Row(
      children: <Widget>[
        Expanded(
            flex: 2,
            child: Center(
              child: Text(
                questionLeft.toString(),
                style: TextStyle(fontSize: 36.0),
              ),
            )),
        Expanded(
            flex: 2,
            child: Center(
                child: Text(operator, style: TextStyle(fontSize: 30.0)))),
        Expanded(
            flex: 2,
            child: Center(
              child: Text(
                questionRight.toString(),
                style: TextStyle(fontSize: 36.0),
              ),
            )),
        Expanded(
            flex: 2,
            child: Center(
              child: Text(
                "=",
                style: TextStyle(fontSize: 30.0),
              ),
            )),
        Expanded(
            flex: 2,
            child: Center(
              child: Text(
                answerString,
                style: TextStyle(fontSize: 60.0),
              ),
            )),
      ],
    );
  }

  //TODO 電卓ボタン部分
  Widget _calcButtons() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
        child: Table(
          children: [
            TableRow(
                children: [
                  _calcButton("7"),
                  _calcButton("8"),
                  _calcButton("9"),
                ]
            ),
            TableRow(
                children: [
                  _calcButton("4"),
                  _calcButton("5"),
                  _calcButton("6"),
                ]
            ),
            TableRow(
                children: [
                  _calcButton("1"),
                  _calcButton("2"),
                  _calcButton("3"),
                ]
            ),
            TableRow(
                children: [
                  _calcButton("0"),
                  _calcButton("-"),
                  _calcButton("C"),
                ]
            ),
          ],
        ),
      ),
    );
  }

  Widget _calcButton(String numString) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 5.0),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.brown)
        ),
        onPressed: () => print(numString), //TODO
        child: Text(numString, style: TextStyle(fontSize: 24.0),),
      ),
    );
  }

  //TODO 〇・バル画像
  Widget _correctIncorrectImage() {
    return Center(child: Image.asset("assets/images/pic_correct.png"));
  }

}


//TODO テスト終了メッセージ
  Widget _endMessage() {
  // 後で消してもOK↓
  return Center(child: Text("テスト終了", style: TextStyle(fontSize: 30.0),));
}

//TODO 答え合わせボタン
Widget _answerCheckButton() {
  return Padding(
    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
    child: SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.brown)
        ),
        onPressed: null,
        child: Text("こたえあわせ", style: TextStyle(fontSize: 14.0),),
      ),
    ),
  );
}

// 戻るボタン
Widget _backButton() {
  return Padding(
    padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
    child: SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green)
        ),
        onPressed: null,
        child: Text("戻る", style: TextStyle(fontSize: 14.0),),
      ),
    ),
  );
}


