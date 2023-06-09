import 'package:flutter/material.dart';
import 'package:local/src/pages/profile/setting.dart';

class Pwmodify extends StatelessWidget {
  const Pwmodify({Key? key}) : super(key: key);
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
                  '비밀번호 설정',
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

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  var formKey = GlobalKey<FormState>();

  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _passwordMismatch = false;
  bool _newpasswordMismatch = false;
  bool _invalidPasswordFormat = false;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _checkPassword() {
    String currentPassword = _currentPasswordController.text;
    String newPassword = _newPasswordController.text;
    String confirmPassword = _confirmPasswordController.text;
    String storedPassword = 'password1'; // DB에서 가져온 비밀번호 (임시 예시)

    setState(() {
      _passwordMismatch = (currentPassword != storedPassword);
      _newpasswordMismatch = (confirmPassword != newPassword);
    });
  }

  void _validatePassword() {
    String password = _newPasswordController.text;
    // 정규식을 사용하여 이메일 형식을 검증하는 패턴
    String pattern = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,16}$';
    RegExp regex = RegExp(pattern);

    setState(() {
      _invalidPasswordFormat = !regex.hasMatch(password);
    });
  }

  @override
  Widget build(BuildContext context) {
    var m = MediaQuery.of(context);
    print("넓이 : ${m.size.width}");
    print("높이 : ${m.size.height}");
    return Column(
      children: [
        Expanded(
          child: Form(
            key: formKey,
            child: ListView(
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
                        alignment: Alignment(-0.9, 0.0),
                        child: Text(
                          '기존 비밀번호',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(height: 10),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    child: TextFormField(
                      controller: _currentPasswordController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffEDEDED),
                        labelText: '비밀번호를 입력해주세요.',
                        labelStyle: TextStyle(color: Color(0xffBDBDBD)),
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
                        alignment: Alignment(-0.9, 0.0),
                        child: Text(
                          '새 비밀번호',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(height: 10),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    child: TextFormField(
                      controller: _newPasswordController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffEDEDED),
                          labelText: '새로운 비밀번호를 입력해주세요.',
                          labelStyle: TextStyle(color: Color(0xffBDBDBD)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffEDEDED)),
                          ),
                          errorText: _invalidPasswordFormat
                              ? '영문, 숫자 조합 8자 이상 16자 이내로 입력하세요.'
                              : null),
                      style: TextStyle(fontSize: 14),
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
                        alignment: Alignment(-0.9, 0.0),
                        child: Text(
                          '비밀번호 확인',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(height: 10),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    child: TextFormField(
                      controller: _confirmPasswordController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffEDEDED),
                        labelText: '비밀번호를 한 번 더 입력해주세요.',
                        labelStyle: TextStyle(color: Color(0xffBDBDBD)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffEDEDED)),
                        ),
                        errorText:
                            _newpasswordMismatch ? '비밀번호가 일치하지 않습니다.' : null,
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
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
              width: double.infinity,
              height: 73,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff6744F2)),
                child: const Text(
                  '다음',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  _validatePassword();
                  _checkPassword();
                  if (!_passwordMismatch &&
                      !_newpasswordMismatch &&
                      !_invalidPasswordFormat) {
                    // 비밀번호가 일치하면
                    // storedPassword = newPassword; 하고
                    // 다음 페이지로 이동
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Setting()));
                  }
                },
              )),
        ),
      ],
    );
  }
}
