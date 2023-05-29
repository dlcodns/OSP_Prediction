import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());  //앱 시작해주세요!, MyApp(메인페이지 주소)
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'result',
      home: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        appBar: AppBar(
            title: IconButton(
                iconSize: 30,
                onPressed: (){
                  //start_select
                },
                icon: Icon(Icons.keyboard_backspace,color: Color(0xff404040),)
            ),
        ),
        body: HomeApp(),
      ),
    );
  }
}
