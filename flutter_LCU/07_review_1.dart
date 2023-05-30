import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());  //앱 시작해주세요!, MyApp(메인페이지 주소)
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

        return MaterialApp(
      title: 'review_1',
      home: Scaffold(
        backgroundColor: const Color(0xffE3DCFF),
        appBar: AppBar(
          backgroundColor: Color(0xffE3DCFF),
          title: Row(
            children: const [
              Icon(Icons.settings_backup_restore,color: Color(0xff404040),              ),
              Text('  다시 보기',
                style: TextStyle(
                  fontSize: 24,
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
