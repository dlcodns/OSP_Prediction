import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());  //앱 시작해주세요!, MyApp(메인페이지 주소)
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'celebration',
      home: Scaffold(
        backgroundColor: const Color(0xffE3DCFF),
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
    return Stack(
      children: [
        Column(
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: Align(
                  alignment: const Alignment(0.0, 0.0),
                  child: Image.asset('5_cele.png',
                      width: MediaQuery.of(context).size.width*0.75)
              ),
            ),
            Align(
              alignment: Alignment(0.0, 0.7),
              child: Text('아무 곳이나 클릭하세요',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffAFA2E5)
                  ),
                  textAlign: TextAlign.center
              ),
            ),
            Container(height: 60),
          ],
        ),
        Expanded(
          child: Opacity(
            opacity: 0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Color(0xffBDBDBD)
              ),
              onPressed: (){
                //메인페이지
              },
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
              )
            ),
          ),
        )
      ],
    );
  }
}
