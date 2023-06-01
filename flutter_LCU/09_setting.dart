import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());  //앱 시작해주세요!, MyApp(메인페이지 주소)
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

return MaterialApp(
      title: 'setting',
      home: Scaffold(
        backgroundColor: const Color(0xffE3DCFF),
        appBar: AppBar(
          toolbarHeight: 100,
          elevation: 4,
          shadowColor: Color(0xffE6E6E6),
          backgroundColor: Color(0xffE3DCFF),
          title: Padding(
            padding: EdgeInsets.only(right:12.0,top:43),
            child: Row(
              children: const [
                Icon(Icons.settings, color: Color(0xff404040), size: 30,              ),
                Text('  설정',
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

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  final TextEditingController _currentPasswordController = TextEditingController();
  bool _passwordMismatch = false;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    super.dispose();
  }

  void _checkPassword() {
    String currentPassword = _currentPasswordController.text;
    String storedPassword = 'password'; // DB에서 가져온 비밀번호 (임시 예시)

    setState(() {
      _passwordMismatch = (currentPassword != storedPassword);
    });
  }
  @override
  Widget build(BuildContext context){
    var m = MediaQuery.of(context);
    print("넓이 : ${m.size.width}");
    print("높이 : ${m.size.height}");
    return ListView(
      children: [
        Expanded(
          child: SizedBox(
              height: 180,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xffE3DCFF)
                ),
              )
          ),
        ),
        Expanded(
          child: SizedBox(height: 6,
              child: Container(
                decoration: BoxDecoration(color: Color(0xffD3CCEC)),)),
        ),
        Expanded(
          child: SizedBox(
            height: 45,

            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Flexible(
                    flex: 17,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('    내 정보',
                            style: TextStyle(
                                color: Color(0xff918E9F),
                                fontWeight: FontWeight.bold,
                                fontSize: 13
                            )
                        ),
                        Align(
                            child: Icon(Icons.arrow_forward_ios,
                              color: Color(0xffE3DCFF),)
                        )
                      ],
                    ),
                  )
                ]
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
              height: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xffD3CCEC)
                ),
              )
          ),
        ),

        Expanded(
          child: SizedBox(
            height: 45,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>Modify()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffE3DCFF),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Flexible(
                      flex: 17,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('회원 정보 수정',
                              style: TextStyle(
                                  color: Color(0xff404040),
                                  fontSize: 15
                              )
                          ),
                          Align(
                              child: Icon(Icons.arrow_forward_ios, color: Color(
                                  0xff726F7A),)
                          )
                        ],
                      ),
                    )
                  ]
              ),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(height: 1,
              child: Container(
                decoration: BoxDecoration(color: Color(0xffD3CCEC)),)),
        ),

        Expanded(
          child: SizedBox(
            height: 45,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>Pwmodify()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffE3DCFF),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Flexible(
                      flex: 17,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('비밀번호 설정',
                              style: TextStyle(
                                  color: Color(0xff404040),
                                  fontSize: 15
                              )
                          ),
                          Align(
                              child: Icon(Icons.arrow_forward_ios, color: Color(
                                  0xff726F7A),)
                          )
                        ],
                      ),
                    )
                  ]
              ),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(height: 6,
              child: Container(
                decoration: BoxDecoration(color: Color(0xffD3CCEC)),)),
        ),

        Expanded(
          child: SizedBox(
            height: 45,

            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Flexible(
                    flex: 17,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('    설정',
                            style: TextStyle(
                                color: Color(0xff918E9F),
                                fontWeight: FontWeight.bold,
                                fontSize: 13
                            )
                        ),
                        Align(
                            child: Icon(Icons.arrow_forward_ios,
                              color: Color(0xffE3DCFF),)
                        )
                      ],
                    ),
                  )
                ]
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
              height: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xffD3CCEC)
                ),
              )
          ),
        ),

        Expanded(
          child: SizedBox(
            height: 45,
            child: ElevatedButton(
              onPressed: () {
                //알림 설정
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffE3DCFF),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Flexible(
                      flex: 17,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('알림 설정',
                              style: TextStyle(
                                  color: Color(0xff404040),
                                  fontSize: 15
                              )
                          ),
                          Align(
                              child: Icon(Icons.arrow_forward_ios, color: Color(
                                  0xff726F7A),)
                          )
                        ],
                      ),
                    )
                  ]
              ),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(height: 1,
              child: Container(
                decoration: BoxDecoration(color: Color(0xffD3CCEC)),)),
        ),

        Expanded(
          child: SizedBox(
            height: 45,
            child: ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),),
                  ),
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                          height: MediaQuery.of(context).size.height * 0.3, // 모달 높이 크기
                          decoration: BoxDecoration(
                            color: Colors.white, // 모달 배경색
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                          ), // 모달 배경색
                          child: Column(
                            children: [
                              Container(height: MediaQuery.of(context).size.height * 0.03),
                              Text(
                                '로그아웃 하시겠습니까?',
                                style: TextStyle(
                                  color: Color(0xff404040),
                                  fontSize: 16,),
                                ),
                                Container(height: MediaQuery.of(context).size.height*0.07),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      fit: FlexFit.loose,
                                      child: SizedBox(
                                          width: MediaQuery.of(context).size.width*0.3,
                                          height: 43,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(5)
                                              ),
                                              backgroundColor: const Color(0xffA490F8),),
                                            child: const Text('취소',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          )
                                      ),
                                    ),
                                    Container(width: MediaQuery.of(context).size.width*0.15),
                                    Flexible(
                                      fit: FlexFit.loose,
                                      child: SizedBox(
                                        width: MediaQuery.of(context).size.width * 0.3,
                                        height: 43,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(5)
                                            ),
                                            backgroundColor: const Color(0xffD9D9D9),
                                          ),
                                          child: const Text(
                                            '로그아웃',
                                            style: TextStyle(
                                              color: Color(0xffA490F8),
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          onPressed: () {
                                            //start_select 페이지 이동
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                            ]
                          ),
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffE3DCFF),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Flexible(
                      flex: 17,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('로그아웃',
                              style: TextStyle(
                                  color: Color(0xff404040),
                                  fontSize: 15
                              )
                          ),
                          Align(
                              child: Icon(Icons.arrow_forward_ios, color: Color(
                                  0xff726F7A),)
                          )
                        ],
                      ),
                    )
                  ]
              ),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(height: 1,
              child: Container(
                decoration: BoxDecoration(color: Color(0xffD3CCEC)),)),
        ),

        Expanded(
          child: SizedBox(
            height: 45,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Flexible(
                    flex: 17,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {
                              showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),),
                                ),
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    height: MediaQuery.of(context).size.height * 0.4, // 모달 높이 크기
                                    decoration: BoxDecoration(
                                      color: Colors.white, // 모달 배경색
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                      ),
                                    ), // 모달 배경색
                                    child: ListView(
                                        children: [
                                          Container(height: 20),
                                          const Align(
                                            alignment: Alignment(-0.8,0.0),
                                            child: Text('비밀번호 입력',
                                              style: TextStyle(
                                                  fontSize: 16
                                              ),
                                            ),
                                          ),
                                          Container(height: 10),
                                          Center(
                                            child: SizedBox(
                                              width: MediaQuery.of(context).size.width * 0.9,
                                              height: 50,
                                              child: TextField(
                                                controller: _currentPasswordController,
                                                decoration: InputDecoration(
                                                  filled: true,
                                                  fillColor: Color(0xffEDEDED),
                                                  labelText: '비밀번호를 입력하세요.',
                                                  labelStyle: TextStyle(
                                                    color: Color(0xffBDBDBD),
                                                  ),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Color(0xffEDEDED)),
                                                  ),
                                                  errorText: _passwordMismatch ? '비밀번호가 맞지 않습니다.' : null,
                                                ),
                                                style: TextStyle(fontSize: 14),
                                                obscureText: true,
                                                enableSuggestions: false,
                                                autocorrect: false,
                                              ),
                                            ),
                                          ),
                                          Container(height: MediaQuery.of(context).size.height * 0.05),
                                          Center(
                                            child: Text(
                                              '회원탈퇴 하시겠습니까?',
                                              style: TextStyle(
                                                color: Color(0xff404040),
                                                fontSize: 16,),
                                            ),
                                          ),
                                          Container(height: MediaQuery.of(context).size.height*0.05),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Flexible(
                                                fit: FlexFit.loose,
                                                child: SizedBox(
                                                    width: MediaQuery.of(context).size.width*0.3,
                                                    height: 43,
                                                    child: ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(5)
                                                        ),
                                                        backgroundColor: const Color(0xffA490F8),),
                                                      child: const Text('취소',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight: FontWeight.bold
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                    )
                                                ),
                                              ),
                                              Container(width: MediaQuery.of(context).size.width*0.15),
                                              Flexible(
                                                fit: FlexFit.loose,
                                                child: SizedBox(
                                                  width: MediaQuery.of(context).size.width * 0.3,
                                                  height: 43,
                                                  child: ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(5)
                                                      ),
                                                      backgroundColor: const Color(0xffD9D9D9),
                                                    ),
                                                    child: const Text(
                                                      '회원탈퇴',
                                                      style: TextStyle(
                                                        color: Color(0xffA490F8),
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      _checkPassword();
                                                      if (!_passwordMismatch){
                                                        //Navigator.push(
                                                         // context,
                                                         // MaterialPageRoute(builder: (context)=>StartSelect()));
                                                      }
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(height: 20),
                                        ]
                                    ),
                                  );
                                },
                              );
                            },
                            child: Text(' 회원 탈퇴',
                            style: TextStyle(
                                color: Color(0xff918E9F),
                                fontWeight: FontWeight.bold,
                                fontSize: 13
                            )
                        ),
                        ),
                        Align(
                            child: Icon(Icons.arrow_forward_ios,
                              color: Color(0xffE3DCFF),)
                        )
                      ],
                    ),
                  )
                ]
            ),
          ),
        ),
      ],
    );
  }
}
