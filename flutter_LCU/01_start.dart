import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());  //앱 시작해주세요!, MyApp(메인페이지 주소)
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'main',
      home: Scaffold(
        backgroundColor: const Color(0xff6744F2),
        body: HomeApp(),
      ),
    );
  }
}

class HomeApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    
  }
}
