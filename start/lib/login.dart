import 'package:flutter/material.dart';
import 'package:start/start_select.dart';

class Login extends StatelessWidget{
  const Login({super.key});

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
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=>StartSelect()));
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

class HomeApp extends StatelessWidget{
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context){
    var m = MediaQuery.of(context);
    print("넓이 : ${m.size.width}");
    print("높이 : ${m.size.height}");
    return ListView(
        children: [
          Container(
            height: 60,
          ),
          Flexible(
            child: Column(
                children: [
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width*0.9,
                      height: 50,
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: '이메일 주소',
                            labelStyle: TextStyle(
                                color: Color(0xffBDBDBD)
                            ),
                            border: OutlineInputBorder()
                        ),
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                  Container(height: 20),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width*0.9,
                      height: 50,
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: '비밀번호',
                            labelStyle: TextStyle(
                                color: Color(0xffBDBDBD)
                            ),
                            border: OutlineInputBorder()
                        ),
                        style: TextStyle(fontSize: 14),
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                      ),
                    ),
                  ),
                ]
            ),
          ),
          Container(height: 35),
          Container(
            alignment: Alignment.topCenter,
            child: SizedBox(
                width: MediaQuery.of(context).size.width*0.9,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff6744F2)),
                  child: const Text('로그인',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  onPressed: () {
                    //메인페이지
                  },
                )
            ),
          ),
          Container(height: 10),
          const Align(
              alignment: Alignment(0.84, -0.7),
              child: Text('이메일 찾기 | 비밀번호 찾기',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xffAEAEAE)
                  )
              )
          ),
        ]
    );
  }
}