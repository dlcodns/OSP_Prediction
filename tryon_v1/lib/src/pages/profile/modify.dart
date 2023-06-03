import 'package:flutter/material.dart';
import 'package:local/src/pages/profile/setting.dart';

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

class Modify extends StatelessWidget {
  const Modify({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'modify',
      home: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        appBar: AppBar(
          toolbarHeight: 60,
          elevation: 4,
          shadowColor: Color(0xffE6E6E6),
          backgroundColor: Color(0xffFFFFFF),
          title: Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Row(
              children: [
                IconButton(
                    iconSize: 30,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Setting()));
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xff404040),
                    )),
                Text(
                  '회원 정보 수정',
                  style: TextStyle(
                      fontSize: 24,
                      color: Color(0xff404040),
                      fontWeight: FontWeight.bold),
                )
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
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var m = MediaQuery.of(context);
    print("넓이 : ${m.size.width}");
    print("높이 : ${m.size.height}");
    return ListView(
      children: [
        Expanded(
          child: Center(
            child: SizedBox(
              height: 225,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xffFFFFFF),
                ),
                child: Stack(
                  alignment:
                      Alignment.bottomRight, // 아이콘을 원의 오른쪽 아래에 위치시키기 위해 설정
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundColor: Color(0xffEDEDED),
                      child: Icon(Icons.person,
                          size: 130, color: Color(0xff757575)),
                    ),
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: Color(0xffFFFFFF),
                      child: MaterialButton(
                        onPressed: () {
                          //수정
                        },
                        color: Color(0xff6744F2),
                        padding: EdgeInsets.all(12),
                        shape: CircleBorder(),
                        child: Icon(
                          Icons.edit,
                          size: 20,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
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
                alignment: Alignment(-0.9, 0.0),
                child: Text(
                  '이름',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
        Container(height: MediaQuery.of(context).size.height * 0.01),
        Center(
          child: Form(
            key: formKey,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.1,
              child: TextFormField(
                enableInteractiveSelection: false,
                focusNode: AlwaysDisabledFocusNode(),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffEDEDED),
                  labelText: '이름 db 불러오기',
                  labelStyle: TextStyle(color: Colors.red),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffEDEDED)),
                  ),
                ),
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
