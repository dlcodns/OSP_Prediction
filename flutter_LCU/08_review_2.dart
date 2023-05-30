import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());  //앱 시작해주세요!, MyApp(메인페이지 주소)
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
        return MaterialApp(
      title: 'review_2',
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
                Icon(Icons.settings_backup_restore, color: Color(0xff404040), size: 30,              ),
                Text('  다시 보기',
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
        Flexible(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                  children:[
                    SizedBox(width: MediaQuery.of(context).size.width*0.02),
                    IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: (){
                          //home
                        },
                        icon: const Icon(Icons.keyboard_backspace,
                            color: Color(0xffFFFFFF),
                            size: 40
                        )
                    ),
                  ]
              ),
              Align(
                alignment: Alignment(0.0,0.8),
                child: Row(
                  children: [
                    IconButton(
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        onPressed: (){
                          //review_1
                        },
                        icon: const Icon(Icons.view_agenda,
                            color: Color(0xffFFFFFF),
                            size: 20
                        )
                    ),
                    IconButton(
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        onPressed: (){
                          //noting
                        },
                        icon: const Icon(Icons.dashboard,
                            color: Color(0xffFFFFFF),
                            size: 20
                        )
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.02),
                  ],
                ),
              ),
            ],
          ),
        ),
        Flexible(
          fit: FlexFit.loose,
          flex: 12,
          child: Center(
            child: Stack(children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffEEEAFF),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width:10,color: Color(0xffEEEAFF)
                  ),
                ),
              ),
              ListView(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start, // 위로 정렬
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(width: 10, color: const Color(0xffEEEAFF)),
                                ),
                                child: Image.asset('miso.jpg', fit: BoxFit.contain),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(width: 10, color: const Color(0xffEEEAFF)),
                                ),
                                child: Image.asset('TY.png', fit: BoxFit.contain),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(width: 10, color: const Color(0xffEEEAFF)),
                                ),
                                child: Image.asset('heart.jpg', fit: BoxFit.contain),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(width: 10, color: const Color(0xffEEEAFF)),
                                ),
                                child: Image.asset('miso.jpg', fit: BoxFit.contain),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start, // 위로 정렬
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(width: 10, color: const Color(0xffEEEAFF)),
                                ),
                                child: Image.asset('heart.jpg', fit: BoxFit.contain),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(width: 10, color: const Color(0xffEEEAFF)),
                                ),
                                child: Image.asset('kitty.png', fit: BoxFit.contain),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(width: 10, color: const Color(0xffEEEAFF)),
                                ),
                                child: Image.asset('TY.png', fit: BoxFit.contain),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ]
              ),
            ]
              ),
            ),
          ),
      ],
    );
  }
}
