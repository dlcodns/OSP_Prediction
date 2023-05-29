import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());  //앱 시작해주세요!, MyApp(메인페이지 주소)
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'start_select',
      home: Scaffold(
        backgroundColor: Color(0xffE3DCFF),
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
    return Column(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Image.asset('2_Fitting_Room.png',width: MediaQuery.of(context).size.width*0.6),
          ),
          ElevatedButton(
                    onPressed: (){},
            style: ElevatedButton.styleFrom(
                      elevation: 5,
                      backgroundColor: Color(0xffFFFFFF),
                    child: Text(
                      '회원가입'
                      ),
            ),
          ElevatedButton(
                    onPressed: (){},
                    child: Text(
                      '로그인'
                      ),
        ],
      );
  }
}
