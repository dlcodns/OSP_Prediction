import 'package:flutter/material.dart';
import 'package:local/mainpage.dart';

class Result extends StatelessWidget {
  const Result({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'result',
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
    return Center(
      child: Stack(
          children: <Widget>[
            Column(
              children: [
                Expanded(
                  flex: 8,
                  child: Align(
                    alignment: Alignment(0.0,0.5),
                    child: Image.asset(
                      'assets/2_Fitting_Room.png',
                      width: MediaQuery.of(context).size.width * 0.5,
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.loose,
                  flex: 25,
                  child: Center(
                    child: Container(
                        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffFFFFFF),
                          border: Border.all(
                              color: Color(0xffEEEAFF),
                              width: 10,
                              style: BorderStyle.solid
                          ),
                        ),
                        child: Image.asset('miso.jpg',fit: BoxFit.contain)
                    ),
                  ),
                ),
                Flexible(
                  flex: 10,
                  child: Align(
                    alignment: Alignment(0.0,-0.6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          fit: FlexFit.loose,
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width*0.3,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xffA490F8),),
                                child: const Text('저장',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                onPressed: () {
                                  //갤러리에 저장
                                },
                              )
                          ),
                        ),
                        Flexible(
                          child: SizedBox(width: MediaQuery.of(context).size.width*0.15),
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xffFFFFFF),
                              ),
                              child: const Text(
                                '메인',
                                style: TextStyle(
                                  color: Color(0xffA490F8),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context)=>MainPage()));
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ]
      ),
    );
  }
}
