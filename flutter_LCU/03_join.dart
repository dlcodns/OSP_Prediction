import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());  //앱 시작해주세요!, MyApp(메인페이지 주소)
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'join',
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
                      //Navigator.push(
                      //    context,
                      //    MaterialPageRoute(builder: (context)=>StartSelect()));
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
    return ListView(
              children: [
                const Align(
                  alignment: Alignment(-0.9,0.0),
                  child: Text('\n이메일*',
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                ),
                Container(height: 5),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width*0.9,
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: 'ex) woowang@gmail.com',
                          labelStyle: TextStyle(
                              color: Color(0xffBDBDBD)
                          ),
                          border: OutlineInputBorder()
                      ),
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
                ]
      );
  }
}
