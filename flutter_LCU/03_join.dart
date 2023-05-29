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
    return Column(
      children: [
        Expanded(
          child: ListView(
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
                Container(height: 10),
                const Align(
                  alignment: Alignment(-0.9,0.0),
                  child: Text('비밀번호*',
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
                          labelText: '영문, 숫자 조합 8~16자',
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
                Container(height: 10),
                const Align(
                  alignment: Alignment(-0.9,0.0),
                  child: Text('비밀번호 확인*',
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
                          labelText: '비밀번호를 한 번 더 입력해주세요.',
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
                Container(height: 10),
                const Align(
                  alignment: Alignment(-0.9,0.0),
                  child: Text('이름*',
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
                          labelText: 'ex) 김우왕',
                          labelStyle: TextStyle(
                              color: Color(0xffBDBDBD)
                          ),
                          border: OutlineInputBorder()
                      ),
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
                Container(height: 50),
                Column(
                  children: [
                    Row(
                      children: [
                        const CheckboxExample(),
                        const Text('이용약관 필수 동의',
                          style: TextStyle(
                              fontSize: 14
                          ),
                        ),
                        SizedBox(
                          height: 19.0,
                          child: TextButton(
                            child: const Text('자세히 보기',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 14,
                                  color: Color(0xff404040)
                              ),
                            ),
                            onPressed: (){
                              //서비스 이용약관
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const CheckboxExample(),
                        const Text('개인정보 처리방침 필수 동의',
                          style: TextStyle(
                              fontSize: 14
                          ),
                        ),
                        SizedBox(
                          height: 19.0,
                          child: TextButton(
                            child: const Text('자세히 보기',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 14,
                                  color: Color(0xff404040)
                              ),
                            ),
                            onPressed: (){
                              //개인정보 처리방침
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const CheckboxExample(),
                        const Text('위치정보 이용 약관 필수 동의',
                          style: TextStyle(
                              fontSize: 14
                          ),
                        ),
                        SizedBox(
                          height: 19.0,
                          child: TextButton(
                            child: const Text('자세히 보기',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 14,
                                  color: Color(0xff404040)
                              ),
                            ),
                            onPressed: (){
                              //위치정보 이용 약관 필수 동의
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const CheckboxExample(),
                        const Text('마케팅 정보 수신 선택 동의',
                          style: TextStyle(
                              fontSize: 14
                          ),
                        ),
                        SizedBox(
                          height: 19.0,
                          child: TextButton(
                            child: const Text('자세히 보기',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 14,
                                  color: Color(0xff404040)
                              ),
                            ),
                            onPressed: (){
                              //마케팅 정보 수신 선택 동의
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        CheckboxExample(),
                        Text('만 14세 이상임에 필수 동의',
                          style: TextStyle(
                              fontSize: 14
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ]
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
              width:double.infinity,
              height: 73,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Color(0xff6744F2)),
                child: const Text('다음',
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
class CheckboxExample extends StatefulWidget {
  const CheckboxExample({super.key});

  @override
  State<CheckboxExample> createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return const Color(0xff6744F2);
      }
      return const Color(0xffBDBDBD);
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
