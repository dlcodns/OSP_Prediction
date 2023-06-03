import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../../../api/api.dart';
import '../../../repository/user_repo.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isSignupScreen = true;
  final _formKey = GlobalKey<FormState>();

  /** user정보 담아두는 변수 */
  String userGender = '';
  String userName = '';
  String userEmail = '';
  String userPassword = '';

  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

/** email 유효성 검사 */
  checkUserEmail() async {
    try {
      var response = await http.post(
        Uri.parse(API.validateEmail),
        body: {
          'user_email': emailController.text.trim(),
        },
      );
      var statusCode = response.statusCode;
      print("statusCode: ${statusCode}");
      print('시도함');
      if (response.statusCode == 200) {
        print('연결 성공함');
        //var responsestring = response.body.toString();

        print('이거임');
        // print(responsestring);

        //jsonDecode가 문제를 일으키는 것으로 분석중임.. 어떻게 고쳐야할지 알아내야함
        var responsebody = jsonDecode(response.body);
        print('이게 마지막이 될 것');
        print(responsebody);

        if (responsebody["existEmail"] == true) {
          print('됐다고 시키야');
          Fluttertoast.showToast(msg: "이미 등록된 이메일입니다 다른 이메일을 사용해주시기 바랍니다");
        } else {
          print('정보 보냄');
          await saveInfo();
          print('정보 보냄2');
        }
      } else {
        print('연결 안된거임');
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  /** 유효성 검사 후 유저 정보 데이터베이스에 넣는 함수 */
  saveInfo() async {
    User userModel = User(
      user_id: 1,
      user_name: userNameController.text.trim(),
      user_gender: "",
      user_nickname: "",
      user_phonenumber: 0,
      user_studentID: 0,
      user_email: emailController.text.trim(),
      user_password: passwordController.text.trim(),
      user_age: 0,
      user_imageUrls: "",
      user_bio: "",
      user_major: "",
    );
    print(userModel.toJson());

    try {
      var res = await http.post(
        Uri.parse(API.signup),
        body: userModel.toJson(),
      );
      var statusCodelate = res.statusCode;
      print('이건 saveinfo 서버 상태');
      print("statusCode: ${statusCodelate}");

      if (res.statusCode == 200) {
        print('여긴 성공');
        var resSignup = jsonDecode(res.body);
        print('saveinfo 서버연결 성공');
        if (resSignup['success'] == true) {
          Fluttertoast.showToast(msg: '회원가입이 완료되었습니다!');
          userLogin();
          setState(() {
            userNameController.clear();
            emailController.clear();
            passwordController.clear();
          });
        } else {
          print(userModel.toJson());
        }
      }
    } catch (e) {
      print('saveinfo 서버연결 실패임');
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  userLogin() async {
    print('시작함');
    try {
      var res = await http.post(Uri.parse(API.login), body: {
        'user_email': emailController.text.trim(),
        'user_password': passwordController.text.trim()
      });
      print('통과함');

      var statusCodelate = res.statusCode;
      print('이건 userlogin 서버 상태');
      print("statusCode: ${statusCodelate}");

      if (res.statusCode == 200) {
        var resLogin = jsonDecode(res.body);
        print(resLogin);
        if (resLogin['success'] == true) {
          print('통과했다고');
          Fluttertoast.showToast(msg: '로그인되었습니다!');

          //로그인 정보를 바탕으로 자동 로그인 구현해야함
          // User userInfo = User.fromJson(resLogin['userData']);

          //print(userInfo);

          setState(() {
            emailController.clear();
            passwordController.clear();
          });

          Navigator.pushNamed(
            context,
            '/app',
          );
        } else {
          Fluttertoast.showToast(msg: '로그인에 실패하였습니다');
        }
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.1,
                      color: Colors.white,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.2,
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                            child: Text(
                              '안녕하세요\n오늘의 충북대입니다',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                            child: Text(isSignupScreen
                                ? '회원가입하여 자신을 뽐내보세요!'
                                : '로그인하여 편리한 서비스를 이용해보세요'),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: isSignupScreen
                          ? MediaQuery.of(context).size.height * 0.4
                          : MediaQuery.of(context).size.height * 0.35,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 15,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isSignupScreen = false;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        '로그인',
                                        style: TextStyle(
                                          color: !isSignupScreen
                                              ? Colors.black
                                              : Colors.grey,
                                          fontSize: 16,
                                        ),
                                      ),
                                      if (!isSignupScreen)
                                        Container(
                                          margin: EdgeInsets.only(top: 3),
                                          height: 2,
                                          width: 55,
                                          color: Colors.black,
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isSignupScreen = true;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        '회원가입',
                                        style: TextStyle(
                                          color: !isSignupScreen
                                              ? Colors.grey
                                              : Colors.black,
                                          fontSize: 16,
                                        ),
                                      ),
                                      if (isSignupScreen)
                                        Container(
                                          margin: EdgeInsets.only(top: 3),
                                          height: 2,
                                          width: 55,
                                          color: Colors.black,
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          if (!isSignupScreen)
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    /** 로그인 - 이메일 */
                                    TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      key: ValueKey(1),
                                      /*
                                      validator: (value) {
                                        if (value!.isEmpty ||
                                            value.contains('@')) {
                                          return '이메일을 다시 입력해주시기 바랍니다';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        userEmail = value!;
                                      },
                                      onChanged: (value) {
                                        userEmail = value;
                                      },
                                      */
                                      controller: emailController,
                                      validator: (value) {
                                        value == "" ? "이메일을 적어주세요" : null;
                                      },
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(
                                          CupertinoIcons.envelope,
                                          color: Colors.black,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(35),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(35),
                                          ),
                                        ),
                                        hintText: 'ex) hello@gmail.com',
                                        hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                        contentPadding: EdgeInsets.all(10),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),

                                    /** 로그인 - 비밀번호 */
                                    TextFormField(
                                      obscureText: true,
                                      key: ValueKey(2),
                                      controller: passwordController,
                                      validator: (value) {
                                        value == "" ? "비밀번호를 적어주세요" : null;
                                      },
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(
                                          CupertinoIcons.lock,
                                          color: Colors.black,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(35),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(35),
                                          ),
                                        ),
                                        hintText: 'ex) 6자 이상',
                                        hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                        contentPadding: EdgeInsets.all(10),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),

                                    /** 로그인 버튼 */
                                    GestureDetector(
                                      onTap: () {
                                        print('2');
                                        if (_formKey.currentState!.validate()) {
                                          userLogin();
                                        }
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: Text(
                                            isSignupScreen ? '회원가입' : '로그인',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                          //회원가입 시
                          if (isSignupScreen)
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    /** 회원가입 - 이름 */
                                    TextFormField(
                                      key: ValueKey(3),
                                      controller: userNameController,
                                      validator: (value) {
                                        value == "" ? "이름을 적어주세요" : null;
                                      },
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(
                                          CupertinoIcons.person_circle,
                                          color: Colors.black,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(35),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(35),
                                          ),
                                        ),
                                        hintText: '이름을 적어주세요',
                                        hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                        contentPadding: EdgeInsets.all(10),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),

                                    /** 회원가입 - 이메일 */
                                    TextFormField(
                                      key: ValueKey(4),
                                      controller: emailController,
                                      validator: (value) {
                                        value == "" ? "이메일을 적어주세요" : null;
                                      },
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(
                                          CupertinoIcons.envelope,
                                          color: Colors.black,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(35),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(35),
                                          ),
                                        ),
                                        hintText: 'ex) hello@gmail.com',
                                        hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                        contentPadding: EdgeInsets.all(10),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),

                                    /** 회원가입 - 비밀번호 */
                                    TextFormField(
                                      obscureText: true,
                                      key: ValueKey(5),
                                      controller: passwordController,
                                      validator: (value) {
                                        value == "" ? "비밀번호를 적어주세요" : null;
                                      },
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(
                                          CupertinoIcons.lock,
                                          color: Colors.black,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(35),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(35),
                                          ),
                                        ),
                                        hintText: '6자 이상',
                                        hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                        contentPadding: EdgeInsets.all(10),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '밑으로 가서 성별과 사진을 선택해주세요!',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    if (isSignupScreen)
                      const SizedBox(
                        height: 25,
                      ),
                    if (isSignupScreen)
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 800,
                        color: Colors.white,
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              color: Colors.white,
                              child: Center(
                                child: Text(
                                  '성별을 선택해주세요!',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),

                            /** 회원가입 버튼 */
                            GestureDetector(
                              onTap: () {
                                print(emailController.text.trim());
                                print(userNameController.text.trim());
                                print(passwordController.text.trim());
                                print('이건 됨');
                                if (_formKey.currentState!.validate()) {
                                  checkUserEmail();
                                } else {
                                  print('이건안돼');
                                }
                                print('이거도 됨');
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    isSignupScreen ? '회원가입' : '로그인',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
