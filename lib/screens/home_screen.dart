import 'package:flutter/material.dart';
import 'package:my_own_memo/screens/test_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<DropdownMenuItem<int>> _memuItems = [];
  int _numberOfQuestions = 0;

  @override
  void initState() {
    // 一度しか呼びされない
    super.initState();
    setMenuItems();
    _numberOfQuestions = _memuItems[0].value;
  }

  void setMenuItems() {
    // _memuItems.add(DropdownMenuItem(
    //   value: 10,
    //   child: Text(10.toString()),
    // ));
    // _memuItems.add(DropdownMenuItem(
    //   value: 20,
    //   child: Text(20.toString()),
    // ));
    // _memuItems.add(DropdownMenuItem(
    //   value: 30,
    //   child: Text(30.toString()),
    // ));

    _memuItems..add(DropdownMenuItem(
      value: 10,
      child: Text(10.toString()),
    ))..add(DropdownMenuItem(
      value: 20,
      child: Text(20.toString()),
    ))..add(DropdownMenuItem(
      value: 30,
      child: Text(30.toString()),
    ));
    // _memuItems = [
    // DropdownMenuItem(value: 10,child: Text(10.toString()),),
    // DropdownMenuItem(value: 10,child: Text(10.toString()),),
    // DropdownMenuItem(value: 10,child: Text(10.toString()),),
    // ];
  }

  @override
  Widget build(BuildContext context) {
    print(_memuItems[0].child);
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
                  SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    "問題数を選択して「スタート」ボタンを押してください",
                    style: TextStyle(fontSize: 12.0),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  DropdownButton(
                    items: _memuItems,
                    value: _numberOfQuestions,
                    onChanged: changerDropdownItem,
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.only(bottom: 12.0),
                      child: ElevatedButton.icon(
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.brown),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                              )),
                        ),
                        onPressed: () => startTestScreen(context), //TODO
                        label: Text("スタート"),
                        icon: Icon(Icons.skip_next),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  changerDropdownItem(int selectedValue) {
    setState(() {
      _numberOfQuestions = selectedValue;
    });
  }

  startTestScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
        builder: (context) => TestScreen(
             numberOFQuestions: _numberOfQuestions
        )));
  }


}