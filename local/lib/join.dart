import 'package:flutter/material.dart';
import 'package:local/start_select.dart';
import 'package:local/celebration.dart';

class Join extends StatelessWidget{
  const Join({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'result',
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

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  var formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _PasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  bool _passwordMismatch = false;
  bool _invalidEmailFormat = false;
  bool _invalidPasswordFormat = false;
  bool _emailNotStored = false;
  //bool _agreeTermsError = false;

  bool _isTermsChecked1 = false;
  bool _isTermsChecked2 = false;
  bool _isTermsChecked3 = false;
  bool _isTermsChecked4 = false;
  bool _isTermsChecked5 = false;

  @override
  void dispose() {
    _emailController.dispose();
    _PasswordController.dispose();
    _confirmPasswordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  void _checkPassword() {
    String Password = _PasswordController.text;
    String confirmPassword = _confirmPasswordController.text;

    setState(() {
      _passwordMismatch = (confirmPassword != Password);
    });
  }

  void _validateEmail() {
    String email = _emailController.text;
    // 정규식을 사용하여 이메일 형식을 검증하는 패턴
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);

    setState(() {
      _invalidEmailFormat = !regex.hasMatch(email);
      _emailNotStored = _emailExistsInDatabase(email); // 이메일이 DB에 존재하지 않을 경우
    });
  }

  void _validatePassword() {
    String password = _PasswordController.text;
    // 정규식을 사용하여 이메일 형식을 검증하는 패턴
    String pattern = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,16}$';
    RegExp regex = RegExp(pattern);

    setState(() {
      _invalidPasswordFormat = !regex.hasMatch(password);
    });
  }

  bool _emailExistsInDatabase(String email) {
    //DB에서 가져오는 로직 구현
    // 일단 'test@example.com' 이 존재하는 것으로 가정.
    return email == 'test@example.com';
  }

  bool _isAllTermsChecked() {
    return _isTermsChecked1 && _isTermsChecked2 && _isTermsChecked3 && _isTermsChecked4;
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
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'ex) woowang@gmail.com',
                          labelStyle: TextStyle(
                              color: Color(0xffBDBDBD)
                          ),
                          border: OutlineInputBorder(),
                          errorText: _invalidEmailFormat
                              ? '잘못된 이메일 형식입니다.'
                              : (_emailNotStored ? '이미 있는 이메일입니다.' : null),
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
                        controller: _PasswordController,
                        decoration: InputDecoration(
                            labelText: '영문, 숫자 조합 8~16자',
                            labelStyle: TextStyle(
                                color: Color(0xffBDBDBD)
                            ),
                            border: OutlineInputBorder(),
                            errorText: _invalidPasswordFormat
                                ? '영문, 숫자 조합 8자 이상 16자 이내로 입력하세요.' : null
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
                        controller: _confirmPasswordController,
                        decoration: InputDecoration(
                          labelText: '비밀번호를 한 번 더 입력해주세요.',
                          labelStyle: TextStyle(
                              color: Color(0xffBDBDBD)
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
                          border: OutlineInputBorder(),
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
                          Checkbox(
                            value: _isTermsChecked1,
                            onChanged: (value) {
                              setState(() {
                                _isTermsChecked1 = value!;
                                //_agreeTermsError = !_isAllTermsChecked();
                              });
                            },
                          ),
                          const Text('이용약관 필수 동의',
                            style: TextStyle(
                                fontSize: 14
                            ),
                          ),
                          SizedBox(
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
                          Checkbox(
                            value: _isTermsChecked2,
                            onChanged: (value) {
                              setState(() {
                                _isTermsChecked2 = value!;
                                //_agreeTermsError = !_isAllTermsChecked();
                              });
                            },
                          ),
                          const Text('개인정보 처리방침 필수 동의',
                            style: TextStyle(
                                fontSize: 14
                            ),
                          ),
                          SizedBox(
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
                          Checkbox(
                            value: _isTermsChecked3,
                            onChanged: (value) {
                              setState(() {
                                _isTermsChecked3 = value!;
                                //_agreeTermsError = !_isAllTermsChecked();
                              });
                            },
                          ),
                          const Text('위치정보 이용 약관 필수 동의',
                            style: TextStyle(
                                fontSize: 14
                            ),
                          ),
                          SizedBox(
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
                          Checkbox(
                            value: _isTermsChecked5,
                            onChanged: (value) {
                              setState(() {
                                _isTermsChecked5 = value!;
                              });
                            },
                          ),
                          const Text('마케팅 정보 수신 선택 동의',
                            style: TextStyle(
                                fontSize: 14
                            ),
                          ),
                          SizedBox(
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
                        children: [
                          Checkbox(
                            value: _isTermsChecked4,
                            onChanged: (value) {
                              setState(() {
                                _isTermsChecked4 = value!;
                                //_agreeTermsError = !_isAllTermsChecked();
                              });
                            },
                          ),
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
                  _validateEmail();
                  _validatePassword();
                  _checkPassword();
                  if (!_invalidEmailFormat && !_invalidPasswordFormat && !_emailNotStored && !_passwordMismatch && _isAllTermsChecked()) {
                    //비밀번호가 일치하면 다음 페이지로 이동
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>Celebration()));
                  }
                },
              )
          ),
        ),
      ],
    );
  }
}
