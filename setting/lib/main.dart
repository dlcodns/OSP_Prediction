import 'package:flutter/material.dart';
import 'package:setting/modify.dart';

void main() {
  runApp(const Setting());  //앱 시작해주세요!, MyApp(메인페이지 주소)
}

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);
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

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                //비밀번호 설정
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
                //비밀번호 설정
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
                      children: const [
                        Text('    회원 탈퇴',
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
      ],
    );
  }
}
