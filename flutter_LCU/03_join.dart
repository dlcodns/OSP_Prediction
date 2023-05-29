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
            title: Row(
              children:  [
              IconButton(
                  iconSize: 30,
                  onPressed: (){
                    //start_select
                  },
                  icon: Icon(Icons.keyboard_backspace,color: Color(0xff404040),)
              ),
                Text('  회원가입',
                  style: TextStyle(
                      fontSize: 28,
                      color: Color(0xff404040),
                      fontWeight: FontWeight.bold
                  ),)
              ],
            ),
        ),
        body: HomeApp(),
      ),
    );
  }
}

class HomeApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    var m = MediaQuery.of(context);
    print("넓이 : ${m.size.width}");
    print("높이 : ${m.size.height}");
  }
}
