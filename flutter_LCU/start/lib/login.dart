import 'package:flutter/material.dart';
import 'package:start/start_select.dart';

class Login extends StatelessWidget{
  const Login({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Login',
      home: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        appBar: AppBar(
          toolbarHeight: 60,
          elevation: 0,
          shadowColor: Color(0xffE6E6E6),
          backgroundColor: Color(0xffFFFFFF),
          title: Padding(
            padding: EdgeInsets.only(right:12.0,top:30),
            child: Row(
              children: [
                IconButton(
                  iconSize: 30,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>StartSelect()));
                  },
                  icon: Icon(Icons.keyboard_backspace, color: Color(0xff404040)),
                ),
                Text(
                  '  로그인',
                  style: TextStyle(
                    fontSize: 28,
                    color: Color(0xff404040),
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _currentPasswordController = TextEditingController();
  bool _passwordMismatch = false;
  bool _invalidEmailFormat = false;
  bool _emailNotStored = false;

  @override
  void dispose() {
    _emailController.dispose();
    _currentPasswordController.dispose();
    super.dispose();
  }

  void _checkPassword() {
    String currentPassword = _currentPasswordController.text;
    String storedPassword = 'password1'; // DB에서 가져온 비밀번호 (임시 예시)

    setState(() {
      _passwordMismatch = (currentPassword != storedPassword);
    });
  }

  void _validateEmail() {
    String email = _emailController.text;
    // 정규식을 사용하여 이메일 형식을 검증하는 패턴
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);

    setState(() {
      _invalidEmailFormat = !regex.hasMatch(email);
      _emailNotStored = !_emailExistsInDatabase(email); // 이메일이 DB에 존재하지 않을 경우
    });
  }

  bool _emailExistsInDatabase(String email) {
    // 여기서 실제로 DB에 이메일이 존재하는지 확인하는 로직을 구현해야 합니다.
    // 일단 'test@example.com' 이 존재하는 것으로 가정
    return email == 'test@example.com';
  }

  @override
  Widget build(BuildContext context) {
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
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 50,
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: '이메일 주소',
                      labelStyle: TextStyle(
                        color: Color(0xffBDBDBD),
                      ),
                      border: OutlineInputBorder(),
                      errorText: _invalidEmailFormat ? '잘못된 이메일 형식입니다.' : null,
                    ),
                    style: TextStyle(fontSize: 14),
                    onChanged: (value) {
                      setState(() {
                        _invalidEmailFormat = false;
                        _emailNotStored = false;
                      });
                    },
                    onEditingComplete: _validateEmail,
                  ),
                ),
              ),
              Container(height: 20),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 50,
                  child: TextField(
                    controller: _currentPasswordController,
                    decoration: InputDecoration(
                      labelText: '비밀번호',
                      labelStyle: TextStyle(
                        color: Color(0xffBDBDBD),
                      ),
                      border: OutlineInputBorder(),
                      errorText: _passwordMismatch ? '비밀번호가 맞지 않습니다.' : null,
                    ),
                    style: TextStyle(fontSize: 14),
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(height: 35),
        Container(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff6744F2),
              ),
              child: const Text(
                '로그인',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                _validateEmail();
                _checkPassword();
                if (!_invalidEmailFormat && !_emailNotStored && !_passwordMismatch) {
                  // 비밀번호가 일치하면 다음 페이지로 이동
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => 메인페이지()),
                  // );
                }
              },
            ),
          ),
        ),
        Container(height: 10),
        const Align(
          alignment: Alignment(0.84, -0.7),
          child: Text(
            '이메일 찾기 | 비밀번호 찾기',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xffAEAEAE),
            ),
          ),
        ),
      ],
    );
  }
}
