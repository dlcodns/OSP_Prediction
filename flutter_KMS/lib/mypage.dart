import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyPage());
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mypage',
      home: Scaffold(
        backgroundColor: const Color(0xffE3DCFF),
        appBar: AppBar(
          toolbarHeight: 60,
          elevation: 4,
          shadowColor: Color(0xffE6E6E6),
          backgroundColor: Color(0xffE3DCFF),
          title: Padding(
            padding: EdgeInsets.only(right:12.0),
            child: Row(
              children: const [
                Icon(Icons.menu, color: Color(0xff404040), size: 30),
                Text('  마이페이지',
                  style: TextStyle(
                      fontSize: 24,
                      color: Color(0xff404040),
                      fontWeight: FontWeight.bold
                  ),)
              ],
            ),
          ),
        ),
        body: My(),
      ),
    );
  }
}


class My extends StatefulWidget {
  @override
  _MyPage createState() => _MyPage();
}

class _MyPage extends State<My> {
  String? selectedMyImagePath = null;

  Future<String?> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      return pickedFile.path;
    }
  }

  String getFileName(String? path) {
    if (path == null) {
      return '';
    }
    return path.split('/').last;
  }

  @override
  Widget build(BuildContext context){
    return ListView(
      children: [
        Expanded(
          child: SizedBox(
            height: 330,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffE3DCFF),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 6,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, right:40),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Container(
                            width: 70,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.transparent,
                              border: Border.all(
                                color: Color(0xffD3CCEC),
                                width: 2,
                              ),
                            ),
                            child:  Icon(
                              Icons.settings,
                              color: Color(0xffB2ADC6),
                              size: 35,
                            ),
                          ),
                        )
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child:Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffF1EEFF),
                        ),
                        child: Icon(
                          Icons.person,
                          color: Color(0xffB2ADC6),
                          size: 90,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex:4,
                    child :Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        '김두루미님',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff404040),
                        ),
                      ),
                    )
                  ),
                  Expanded(
                    flex: 9,
                    child: Padding(
                      padding: EdgeInsets.only(right:30, left:30, bottom: 10),
                      child: Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () async {
                            final imagePath = await pickImage();
                            setState(() {
                              selectedMyImagePath = imagePath!;
                            });
                          },
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xffCCC6E6),
                                  blurRadius: 3.0,
                                  spreadRadius: 0.0,
                                  offset: const Offset(0,3),
                                )
                              ],
                              color: Color(0xffF1EEFF),
                            ),
                            child: Row(
                              children: [
                                Padding(padding: EdgeInsets.only(right:10, left:10)),
                                Image.asset(
                                  'assets/bodypic.png',
                                  width: 50,
                                  height: 50,
                                ),
                                Align(
                                  child: Text(
                                    '     신체 이미지 저장 및 변경',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xff404040),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(height: 40),
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
                        Text('    도움말',
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
                          Text('공지사항',
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
                  MaterialPageRoute(builder: (context) => Perinfo()),
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
                          Text('개인정보 처리방침',
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
                  MaterialPageRoute(builder: (context) => Service()),
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
                          Text('서비스 이용 약관',
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
                          Text('오픈소스 라이선스',
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
                          Text('버전정보 v1.0',
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
                          Text('실험실',
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
          child: SizedBox(
              height: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xffD3CCEC)
                ),
              )
          ),
        ),
      ],
    );
  }
}

class Perinfo extends StatelessWidget {
  const Perinfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'perinfo',
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 60,
          elevation: 4,
          shadowColor: Color(0xffE6E6E6),
          backgroundColor: Color(0xffE3DCFF),
          title: Padding(
            padding: EdgeInsets.only(right:12.0),
            child: Row(
              children: const [
                Icon(Icons.arrow_back_ios, color: Color(0xff404040), size: 30),
                Text('  개인정보 처리방침',
                  style: TextStyle(
                      fontSize: 24,
                      color: Color(0xff404040),
                      fontWeight: FontWeight.bold
                  ),)
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 5.0, right: 5.0),
            child:  Text(
                'Fitting Room 개인정보처리방침\n㈜피팅룸코퍼레이션(이하 /피팅룸/이라 합니다)은 서비스의 제공에 있어 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 개인정보보호법 등 관련 개인정보보호 규정을 철저히 준수하며, 관련법령에 따라 본 개인정보 처리방침을 정하여 이용자의 권익 보호에 최선을 다하고 있습니다.\n피팅룸은 본 개인정보 처리방침을 통하여 피팅룸이 어떤 정보를 수집하고, 수집한 정보를 어떻게 사용하며, 필요에 따라 누구와 이를 공유(위탁 또는 제공)하며, 이용목적을 달성한 정보를 어떻게 파기하는지 등에 관한 정보를 알려 드립니다. 본 개인정보 처리방침은 피팅룸이 제공하는 서비스에 적용됩니다.\n\n\n1. 수집하는 개인정보 항목\n회원가입 시점에 피팅룸이 이용자로부터 수집하는 개인정보는 아래와 같습니다.\n이메일 가입 시\n• 필수항목: 이메일 주소, 비밀번호, 닉네임\n\n\n2. 개인정보 수집 및 이용목적\n피팅룸은 서비스의 회원관리, 서비스 제공, 서비스 개선 및 개발, 안전한 서비스 이용환경 구축 등 아래의 목적으로만 이용자의 개인정보를 수집하여 이용합니다.\n• 회원제 서비스 이용에 따른 회원가입 의사의 확인, 이용자 식별 및 본인여부 확인, 회원자격 유지 및 관리, 회원탈퇴 의사의 확인 등 회원관리\n• 관련법령, 이용약관 등 위반행위에 대한 제재, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 질의 및 민원처리 등 이용자 보호 및 서비스 운영\n• 이용자가 안심하고 이용할 수 있는 안전한 서비스 이용환경 구축\n\n\n3. 개인정보의 제 3 자 제공\n피팅룸은 원칙적으로 이용자 동의 없이 개인정보를 제 3 자에게 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.\n• 이용자들이 사전에 동의한 경우\n• 통계작성, 학술연구, 시장조사를 위하여 특정개인을 식별할 수 없는 형태로 가공하여 제공하는 경우\n• 이용자의 생명이나 안전에 급박한 위험이 확인되어 이를 해소하기 위한 경우\n• 기타 관련법령에 의해 개인정보 제출의무가 발생한 경우\n\n\n5. 개인정보의 파기\n피팅룸은 원칙적으로 이용자의 회원 탈퇴(이용계약 해지)시 해당 이용자의 개인정보를 지체없이 파기합니다. 단, 이용자로부터 별도 동의를 얻은 경우나 관련법령에서 일정기간 보관의무를 부과하는 경우에는 해당 기간동안 이를 보관합니다.\n\n이용자로부터 개인정보의 보관기관에 대해 회원가입시 동의를 얻는 경우는 다음과 같습니다.\n• 회원의 이메일 주소, 닉네임 : 탈퇴일로부터 30 일간 보관(재가입, 부정가입 방지, 민원 등 처리 목적)\n\n회원탈퇴, 서비스 종료, 이용자에게 동의받은 개인정보 보유기간의 도래와 같이 개인정보의 수집 및 이용목적이 달성된 개인정보는 재생이 불가능한 방법으로 파기하고 있습니다. 법령에서 보존의무를 부과한 정보에 대해서도 해당 기간 경과 후 지체없이 재생이 불가능한 방법으로 파기합니다.\n개인정보를 파기할 경우, 파기사유가 발생한 개인정보를 선정하고 개인정보보호책임자의 승인을 받아 개인정보를 파기합니다. 출력물 등은 분쇄하거나 소각하는 방법으로, 전자적 파일형태의 경우 복구 및 재생이 되지 않도록 하는 기술적 방법 또는 물리적 방법을 사용하여 파기합니다.\n\n\n6. 개인정보의 안전성 확보조치\n피팅룸은 이용자의 개인정보를 처리함에 있어 안전성을 확보하기 위하여 다음과 같은 대책을 강구하고 있습니다.\n• 이용자의 비밀번호와 같은 중요정보는 암호화하여 저장 및 관리되고 있으며, 개인정보의 확인 및 변경은 비밀번호를 알고 있는 본인에 의해서만 가능합니다.\n• 암호화 통신을 통하여 네트워크상에서 개인정보를 안전하게 송수신하고 있습니다.\n• 내부 관리계획 수립, 운영현황 점검 및 전문인력 확충 등 보안성 확보를 위해 지속적으로 노력하고 있습니다.\n• 개인정보를 처리하는 직원을 최소한으로 관리하고 있으며, 개인정보를 취급하는 직원을 대상으로 주기적인 교육을 실시하며, 전사 임직원에 대한 교육 및 캠페인을 통하여 이용자의 개인정보 보호의 중요성을 인식시키고 있습니다.\n\n단, 피팅룸이 개인정보보호 의무를 다하였음에도 불구하고 이용자 본인의 부주의나 에이블리가 관리하지 않는 영역에서의 사고 등 피팅룸의 귀책에 기인하지 않은 손해에 대해서는 피팅룸이 책임을 지지 않습니다.\n\n\n7. 개인정보 보호책임자 안내\n피팅룸은 개인정보에 대한 의견수렴 및 불만처리, 열람청구에의 대응 등을 위하여 다음과 같이 개인정보보호책임자를 지정하고 있습니다. 이용자는 아래의 연락처로 서비스를 이용하며 발생하는 개인정보에 관한 제반사항에 대한 문의, 개인정보 열람청구 등을 할 수 있고, 피팅룸은 그에 대해 신속하게 답변 및 처리합니다.\n\n• 이름 : 김두루미\n• 직책 : 새\n• 이메일 : dodorumi@gmail.com\n• 전화번호 : 1234-1234\n\n기타 개인정보 침해에 대한 신고나 상담이 필요한 경우에 아래 기관에 문의 가능합니다.\n개인정보침해신고센터 (privacy.kisa.or.kr / 국번없이 118)\n대검찰청 사이버수사과 (www.spo.go.kr / 국번없이 1301)\n경찰청 사이버안전국 (cyberbureau.police.go.kr / 국번없이 182)\n\n\n8. 고지의 의무\n이 개인정보 처리방침은 시행일로부터 적용됩니다. 개인정보 처리방침의 내용은 관련법령, 정부의 정책 또는 보안기술의 변경 등에 따라 변경될 수 있고, 피팅룸은 그 경우 변경된 개인정보 처리방침의 시행일로부터 최소 7 일전에 공지사항을 통해 고지합니다.'
            ),
          )
        ),
      ),
    );
  }
}

class Service extends StatelessWidget {
  const Service({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'service',
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 60,
          elevation: 4,
          shadowColor: Color(0xffE6E6E6),
          backgroundColor: Color(0xffE3DCFF),
          title: Padding(
            padding: EdgeInsets.only(right:12.0),
            child: Row(
              children: const [
                Icon(Icons.arrow_back_ios, color: Color(0xff404040), size: 30),
                Text('  서비스 이용약관',
                  style: TextStyle(
                      fontSize: 24,
                      color: Color(0xff404040),
                      fontWeight: FontWeight.bold
                  ),)
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 5.0, right: 5.0),
              child:  Text(
                '피팅룸 서비스 이용약관\n\n\n제1장 총칙\n\n제1조 (목적)\n이 약관은 ㈜피팅룸코퍼레이션(이하 "회사")이 제공하는 전자상거래 관련 서비스(이하 "서비스")를 이용함에 있어 회사와 회원간의 권리·의무 및 책임사항을 규정하는 것을 그 목적으로 합니다.\n\n\n제2조 (정의)\n이 약관에서 사용하는 용어의 정의는 다음과 같습니다. 이 약관에 정의되지 않은 용어의 의미는 서비스 내 별도 안내 및 관련법령에서 정하는 바에 따르며, 그 외에는 일반 상관례에 따릅니다.\n\n\n제3조 (약관의 게시 및 개정)\n1. 회사는 이 약관의 내용을 회원이 쉽게 알 수 있도록 서비스의 초기화면 또는 별도의 연결 화면에 게시합니다.\n2. 회사는 필요한 경우 관련법령을 위배하지 않는 범위 내에서 이 약관을 개정할 수 있으며, 이 경우 회사는 개정 내용과 적용일자를 명시하여 본조 제1항의 방식에 따라 개정약관의 적용일자 7일 전부터 적용일자 전일까지 공지합니다. 다만, 회원에게 불리한 약관 개정의 경우 그 적용일자 30일 전부터 공지합니다.\n3. 회원이 개정약관에 동의하지 않는 경우 개정약관의 적용일 이전에 회사에 대하여 거부의 의사를 표시하고 이 약관에 의한 이용계약을 해지할 수 있습니다.\n4. 회사가 본조 제2항에 따라 개정약관을 공지하면서 회원에게 개정약관의 적용일 전까지 의사표시를 하지 않으면 동의의 의사가 표명된 것으로 본다는 뜻을 명시하였음에도 회원이 거부의사를 표명하지 아니한 경우 회원은 개정약관에 동의한 것으로 봅니다.\n\n\n제4조 (약관의 준칙)\n1. 회사는 이 약관에 규정되지 않은 내용에 대해 개별 운영 정책 등(이하 /운영정책/)을 제정하여 운영할 수 있으며 이를 서비스 내에 게시합니다. 운영정책은 이 약관과 더불어 이용 계약의 일부를 구성합니다.\n2. 이 약관에서 정하지 아니한 사항은 전자상거래 등에서의 소비자 보호에 관한 법률, 콘텐츠산업진흥법 등 관련법령 및 운영정책에서 정한 바에 따릅니다.\n\n\n제5조 (회원가입)\n1. 서비스에 가입하고자 하는 자(이하 /가입신청자/)는 회사가 정한 가입 양식에 따라 회원정보를 기재한 후 이 약관에 동의한 다음 회원가입을 신청합니다.\n2. 회사는 전항에 따른 회원가입 신청을 승낙하는 것을 원칙으로 합니다. 다만, 다음 각호의 사유가 있는 경우 회사는 가입신청자의 신청에 대해 승낙을 하지 않거나, 사후에 이용계약을 해지할 수 있습니다.\n① 가입신청자가 이 약관 위반 등의 사유로 이전에 회원자격이 상실되었거나 이용계약이 해지되었던 경우\n② 실명이 아니거나, 타인의 명의를 이용한 경우\n③ 신청시 허위의 정보를 기재하거나, 회사가 요구하는 내용을 기재하기 않은 경우 또는 오기가 있는 경우\n④ 기술적 지장 등으로 인해 승낙이 어려운 경우\n⑤ 회사가 본인확인 절차를 실시할 경우에 본인 확인이 되지 않거나 본인이 아님이 확인 된 경우\n⑥ 가입신청자가 만 14세 미만인 경우\n⑦ 기타 이 약관에 위배되거나 위법 또는 부당한 이용신청 등 회사가 합리적인 판단에 의하여 필요하다고 인정하는 경우\n\n3. 이용계약은 회사의 승낙이 가입신청자에게 도달한 시점에 성립하는 것으로 합니다.\n4. 회원은 신청시 기입한 등록사항에 변경이 있는 경우, 즉시 전자우편 기타 방법으로 회사에 대하여 그 변경사항을 알려야 합니다. 회원이 이를 지체하여 발생한 손해에 대해 회사는 책임을 지지 않습니다.\n\n\n제6조 (회원 탈퇴)\n1. 회원은 언제든지 회사에 대하여 탈퇴를 요청할 수 있으며, 회사는 이를 즉시 처리합니다. 다만, 회사와 분쟁이 진행중이거나, 회사에 대한 미지급채무가 남아있는 등 회원자격의 유지가 필요하다고 회사가 판단하는 경우 회사는 한시적으로 처리를 유보할 수 있습니다.\n\n\n제7조 (서비스의 변경)\n1. 회사는 업무상 또는 기술상 사유 등으로 인하여 서비스의 종류를 변경할 수 있으며, 그 경우 그 사유를 제12조에 정한 방법에 따라 사전에 회원에게 통지합니다.\n\n\n제8조 (서비스의 중단)\n1. 회사는 통신, 전력 등의 공급이 중단되는 불가피한 경우는 물론 정보통신설비의 보수점검, 증설, 교체, 이전 등의 유지 관리 업무의 수행, 기타 경영상의 사정 등으로 인해 필요한 경우 7일 이전에 공지 후 서비스의 제공을 일시적으로 중단할 수 있습니다. 다만, 불가피하게 사전 공지를 할 수 없는 경우 회사는 사후 공지할 수 있습니다.\n2. 회사는 천재지변, 전쟁, 폭동, 테러, 해킹, DDOS, 기간통신사업자 등 제3자의 귀책사유, 기타 기술적 장애 등으로 서비스가 중단된 경우 회원에게 즉시 이러한 사실을 공지하되 정보통신설비의 작동불능 등의 사정으로 인해 사전공지가 불가능한 경우에는 이러한 사정이 해소된 이후 즉시 공지합니다. 회사는 본항에 따른 서비스 중단에 대해 어떠한 책임도 지지 않습니다.\n3. 회사는 제1항에 따른 서비스 중단에 대해 고의 또는 중대한 과실이 없는 경우 회원에 대하여 손해배상의 책임을 부담하지 않습니다.\n\n\n제9조 (회사의 권리와 의무)\n1. 회사는 이 약관과 관련법령에 따라 지속적이고 안정적인 서비스를 제공하는데 최우선의 노력을 다합니다.\n2. 회사는 서비스에 관한 회원의 문제제기나 불편사항 신고가 정당하다고 판단되는 경우 우선적으로 이를 해결하기 위해 노력하며, 신속한 해결이 곤란한 경우에는 회원에게 그 사유와 처리절차를 안내합니다.\n3. 회사는 회원의 서비스 이용과 관련한 자료를 통계자료 작성, 서비스의 개선, 신규서비스의 개발 등의 목적으로 활용할 수 있습니다.\n4. 회사는 회원의 서비스 이용과 관련한 자료를 수사기관이 수사목적으로 요청하거나 기타 공공기관이 관련 법률에 따른 절차를 통해 요청하는 경우 회원의 동의 없이 해당 기관에 제공할 수 있습니다.\n\n\n제10조 (회원의 ID 및 비밀번호에 대한 의무)\n1. ID와 비밀번호에 관한 관리책임은 전적으로 회원에게 있습니다.\n2. 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.\n3. 회원이 자신의 ID 및 비밀번호를 도난 당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 회사에 통보하고 회사의 안내가 있는 경우에는 그에 따라야 합니다.\n4. 회원이 본조에 따른 의무를 소홀히 하여 발생하는 모든 불이익에 대해 회사는 일체 책임을 지지 않습니다.\n\n\n제11조 (회원에 대한 통지)\n1. 회사는 이 약관과 관련한 통지 시 회원이 제공한 전자우편주소, (휴대)전화번호, 로그인 시 팝업창, 서비스내 통지문 게시 등의 수단으로 할 수 있습니다.\n2. 회사는 전체 또는 다수의 회원에 대한 통지의 경우 서비스 내에 1주일 이상 게시함으로써 개별 통지에 갈음할 수 있습니다. 다만, 회원의 거래에 관련하여 중대한 영향을 미치는 사항에 대해서는 개별 통지합니다.\n3. 회원은 회사에 실제로 연락이 가능한 전자우편, (휴대)전화번호, 주소 등의 정보를 제공하고, 해당정보들을 최신으로 유지하여야 하며, 회사의 통지를 성실히 확인하여야 합니다.\n4. 회원이 전항의 의무를 소홀히 하여 발생한 불이익에 대해 회사는 책임을 부담하지 않습니다.\n\n\n제12조 (개인정보보호)\n1. 회사는 서비스의 원활한 제공을 위하여 회원이 동의한 목적과 범위 내에서만 회원의 개인정보를 수집, 이용하며, 개인정보보호 관련 법령에 따라 이를 안전하게 관리합니다.\n2. 회사는 수집된 회원의 개인정보에 관하여 동의받은 범위 외의 이용목적이 발생하거나 제3자에게 제공해야 하는 경우 이를 회원에게 고지하고 동의를 받습니다. 다만, 다음의 경우에는 예외로 합니다.\n① 수사기관이나 기타 정부기관으로부터 적법한 절차에 따른 정보제공을 요청받은 경우\n② 관련법령 위반 등 회원의 부정행위를 확인하기 위해 필요한 경우\n③ 판매자 또는 배송업체 등에게 거래 및 배송 등에 필요한 최소한의 회원의 정보(성명, 주소, 전화번호)를 제공하는 경우\n④ 구매가 성사된 때에 그 이행을 위하여 필요한 경우와 구매가 종료된 이후에도 반품, 교환, 환불, 취소 등을 위하여 필요한 경우\n⑤ 기타 관련법령에 의해 요구되는 경우\n\n3. 회사 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체없이 파기합니다.\n4. 회원의 개인정보보호에 관한 상세한 내용은 회사의 개인정보처리방침에 따르며, 회원은 이를 서비스에 링크된 화면을 통하여 확인할 수 있습니다. 단, 회사의 서비스 외부로 링크된 웹페이지에 대해서는 회사의 개인정보처리방침이 적용되지 않습니다. 외부 링크된 웹페이지 및 그와 관련하여 상품 등을 제공하는 제3자의 개인정보 취급과 관련하여서는 해당 웹페이지 및 제3자의 개인정보처리방침이 적용되고, 이를 확인할 책임은 전적으로 회원에게 있으며, 회사는 이에 대하여 책임을 부담하지 않습니다.\n\n\n제13조 (정보의 제공 및 광고의 게재)\n1. 회사는 회원의 서비스 이용 중 필요하다고 인정되는 다양한 마케팅 정보 등을 전자우편, SMS, 전화, 앱 알림 메시지(Push Notification) 등의 방법으로 회원에게 제공할 수 있으며, 회원은 이에 동의합니다. 이 경우, 회원의 통신환경 또는 요금구조 등에 따라 회원이 데이터 요금 등을 부담할 수 있습니다.\n2. 회원은 거래와 관련한 결제, 배송정보, 고객문의에 대한 답변 등과 같이 관련법령에 따라 의무적으로 안내되어야 하는 정보를 제외하고는 언제든지 전항의 전자우편 등에 대해서 수신을 거절할 수 있고, 회사는 수신거절을 위한 방법을 회원에게 제공합니다.'
              ),
            )
        ),
      ),
    );
  }
}
