import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());  //앱 시작해주세요!, MyApp(메인페이지 주소)
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'modify',
      home: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        appBar: AppBar(
          toolbarHeight: 100,
          elevation: 4,
          shadowColor: Color(0xffE6E6E6),
          backgroundColor: Color(0xffFFFFFF),
          title: Padding(
            padding: EdgeInsets.only(right:12.0,top:43),
            child: Row(
              children:  [
                IconButton(
                    iconSize: 30,
                    onPressed: (){
                      //Navigator.push(
                      //    context,
                      //    MaterialPageRoute(builder: (context)=>Setting()));
                    },
                    icon: Icon(Icons.arrow_back_ios,color: Color(0xff404040),)
                ),
                Text('비밀번호 설정',
                  style: TextStyle(
                      fontSize: 24,
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

class HomeApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    var m = MediaQuery.of(context);
    print("넓이 : ${m.size.width}");
    print("높이 : ${m.size.height}");
    return Column(
      children: [
        ListView(
          children: [
            Container(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Flexible(
                  flex: 1,
                  child: SizedBox(),
                ),
                Flexible(
                  flex: 40,
                  child: Align(
                    alignment: Alignment(-0.9,0.0),
                    child: Text('기존 비밀번호',
                      style: TextStyle(
                          fontSize: 16
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(height: 5),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width*0.9,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffEDEDED),
                    labelText: '비밀번호를 입력해주세요.',
                    labelStyle: TextStyle(
                        color: Color(0xffBDBDBD)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffEDEDED)),
                    ),
                  ),
                  style: TextStyle(
                      fontSize: 14),
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                ),
              ),
            ),
            Container(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Flexible(
                  flex: 1,
                  child: SizedBox(),
                ),
                Flexible(
                  flex: 40,
                  child: Align(
                    alignment: Alignment(-0.9,0.0),
                    child: Text('새 비밀번호',
                      style: TextStyle(
                          fontSize: 16
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(height: 5),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width*0.9,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffEDEDED),
                    labelText: '새로운 비밀번호를 입력해주세요.',
                    labelStyle: TextStyle(
                        color: Color(0xffBDBDBD)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffEDEDED)),
                    ),
                  ),
                  style: TextStyle(
                      fontSize: 14),
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                ),
              ),
            ),
            Container(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Flexible(
                  flex: 1,
                  child: SizedBox(),
                ),
                Flexible(
                  flex: 40,
                  child: Align(
                    alignment: Alignment(-0.9,0.0),
                    child: Text('비밀번호 확인',
                      style: TextStyle(
                          fontSize: 16
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(height: 5),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width*0.9,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffEDEDED),
                    labelText: '비밀번호를 한 번 더 입력해주세요.',
                    labelStyle: TextStyle(
                        color: Color(0xffBDBDBD)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffEDEDED)),
                    ),
                  ),
                  style: TextStyle(
                      fontSize: 14),
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                ),
              ),
            ),
          ],
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
              width:double.infinity,
              height: 73,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Color(0xff6744F2)),
                child: const Text('변경',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
                onPressed: (){
                  //Navigator.push(
                  //  context,
                  //  MaterialPageRoute(builder: (context)=>Celebration()));
                },
              )
          ),
        ),
      ],
    );
  }
}
