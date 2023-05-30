import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());  //앱 시작해주세요!, MyApp(메인페이지 주소)
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'login',
      home: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        appBar: AppBar(
          toolbarHeight: 100,
          elevation: 0,
          shadowColor: Color(0xffE6E6E6),
          backgroundColor: Color(0xffFFFFFF),
          title: Padding(
            padding: EdgeInsets.only(right:12.0,top:43),
            child: Row(
              children:  [
                IconButton(
                    iconSize: 30,
                    onPressed: (){
                      //start_select
                    },
                    icon: Icon(Icons.keyboard_backspace,color: Color(0xff404040),)
                ),
                Text('  로그인',
                  style: TextStyle(
                      fontSize: 28,
                      color: Color(0xff404040),
                      fontWeight: FontWeight.bold
                  ),)
              ],
            ),
          ),
        ),
        body: HomeApp(),
      ),
    );
  }
}
